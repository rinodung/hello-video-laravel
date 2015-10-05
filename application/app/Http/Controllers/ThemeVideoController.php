<?php

use \Redirect as Redirect;

class ThemeVideoController extends \BaseController {

    private $videos_per_page = 12;

    public function __construct()
    {
        $this->middleware('secure');
        $settings = Setting::first();
        $this->videos_per_page = $settings->videos_per_page;
    }

    /**
     * Display the specified video.
     *
     * @param  int  $id
     * @return Response
     */
    public function index($id)
    {
        $video = Video::with('tags')->findOrFail($id);


        //Make sure video is active
        if((!Auth::guest() && Auth::user()->role == 'admin') || $video->active){

            $favorited = false;
            if(!Auth::guest()):
                $favorited = Favorite::where('user_id', '=', Auth::user()->id)->where('video_id', '=', $video->id)->first();
            endif;

            $view_increment = $this->handleViewCount($id);

            $data = array(
                'video' => $video,
                'menu' => Menu::orderBy('order', 'ASC')->get(),
                'view_increment' => $view_increment,
                'favorited' => $favorited,
                'video_categories' => VideoCategory::all(),
                'post_categories' => PostCategory::all(),
                'theme_settings' => ThemeHelper::getThemeSettings(),
                'pages' => Page::all(),
                );
            return View::make('Theme::video', $data);

        } else {
            return Redirect::to('videos')->with(array('note' => 'Sorry, this video is no longer active.', 'note_type' => 'error'));
        }
    }

    /*
     * Page That shows the latest video list
     *
     */
    public function videos()
    {   
        $page = Input::get('page');
        if( !empty($page) ){
            $page = Input::get('page');
        } else {
            $page = 1;
        }

        $data = array(
            'videos' => Video::where('active', '=', '1')->orderBy('created_at', 'DESC')->simplePaginate($this->videos_per_page),
            'page_title' => 'All Videos',
            'page_description' => 'Page ' . $page,
            'current_page' => $page,
            'menu' => Menu::orderBy('order', 'ASC')->get(),
            'pagination_url' => '/videos',
            'video_categories' => VideoCategory::all(),
            'post_categories' => PostCategory::all(),
            'theme_settings' => ThemeHelper::getThemeSettings(),
            'pages' => Page::all(),
            );
        return View::make('Theme::video-list', $data);
    }


    public function tag($tag)
    {   
        $page = Input::get('page');
        if( !empty($page) ){
            $page = Input::get('page');
        } else {
            $page = 1;
        }

        if(!isset($tag)){
            return Redirect::to('videos');
        }

        $tag_name = $tag;

        $tag = Tag::where('name', '=', $tag)->first();

        $tags = VideoTag::where('tag_id', '=', $tag->id)->get();

        $tag_array = array();
        foreach($tags as $key => $tag){
            array_push($tag_array, $tag->video_id);
        }

        $videos = Video::where('active', '=', '1')->whereIn('id', $tag_array)->paginate($this->videos_per_page);

        $data = array(
            'videos' => $videos,
            'current_page' => $page,
            'page_title' => 'Videos tagged with "' . $tag_name . '"',
            'page_description' => 'Page ' . $page,
            'menu' => Menu::orderBy('order', 'ASC')->get(),
            'pagination_url' => '/videos/tags/' . $tag_name,
            'video_categories' => VideoCategory::all(),
            'post_categories' => PostCategory::all(),
            'theme_settings' => ThemeHelper::getThemeSettings(),
            'pages' => Page::all(),
            );

        return View::make('Theme::video-list', $data);
    }

    public function category($category)
    {
        $page = Input::get('page');
        if( !empty($page) ){
            $page = Input::get('page');
        } else {
            $page = 1;
        }

        $cat = VideoCategory::where('slug', '=', $category)->first();

        $parent_cat = VideoCategory::where('parent_id', '=', $cat->id)->first();

        if(!empty($parent_cat->id)){
            $parent_cat2 = VideoCategory::where('parent_id', '=', $parent_cat->id)->first();
            if(!empty($parent_cat2->id)){
                $videos = Video::where('active', '=', '1')->where('video_category_id', '=', $cat->id)->orWhere('video_category_id', '=', $parent_cat->id)->orWhere('video_category_id', '=', $parent_cat2->id)->orderBy('created_at', 'DESC')->simplePaginate(9);
            } else {
                $videos = Video::where('active', '=', '1')->where('video_category_id', '=', $cat->id)->orWhere('video_category_id', '=', $parent_cat->id)->orderBy('created_at', 'DESC')->simplePaginate(9);
            }
        } else {
            $videos = Video::where('active', '=', '1')->where('video_category_id', '=', $cat->id)->orderBy('created_at', 'DESC')->simplePaginate(9);
        }


        $data = array(
            'videos' => $videos,
            'current_page' => $page,
            'category' => $cat,
            'page_title' => 'Videos - ' . $cat->name,
            'page_description' => 'Page ' . $page,
            'pagination_url' => '/videos/category/' . $category,
            'menu' => Menu::orderBy('order', 'ASC')->get(),
            'video_categories' => VideoCategory::all(),
            'post_categories' => PostCategory::all(),
            'theme_settings' => ThemeHelper::getThemeSettings(),
            'pages' => Page::all(),
        );

        return View::make('Theme::video-list', $data);
    }

    public function handleViewCount($id){
        // check if this key already exists in the view_media session
        $blank_array = array();
        if (! array_key_exists($id, Session::get('viewed_video', $blank_array) ) ) {
            
            try{
                // increment view
                $video = Video::find($id);
                $video->views = $video->views + 1;
                $video->save();
                // Add key to the view_media session
                Session::put('viewed_video.'.$id, time());
                return true;
            } catch (Exception $e){
                return false;
            }
        } else {
            return false;
        }
    }

}
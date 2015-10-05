<?php

use \Redirect as Redirect;
use \HelloVideo\User as User;

class ThemePostController extends \BaseController {

    private $posts_per_page = 12;

    public function __construct()
    {
        $this->middleware('secure');
        $settings = Setting::first();
        $this->posts_per_page = $settings->posts_per_page;
    }

    /**
     * Display the specified post.
     *
     * @param  int  $id
     * @return Response
     */
    public function index($slug)
    {
        $post = Post::where('slug', '=', $slug)->first();
        
        //Make sure post is active
        if((!Auth::guest() && Auth::user()->role == 'admin') || $post->active){

            $author = User::find($post->user_id);
            $data = array(
                    'post' => $post, 
                    'author' => $author,
                    'menu' => Menu::orderBy('order', 'ASC')->get(),
                    'video_categories' => VideoCategory::all(),
                    'post_categories' => PostCategory::all(),
                    'theme_settings' => ThemeHelper::getThemeSettings(),
                    'pages' => Page::all(),
                );
            return View::make('Theme::post', $data);

        } else {
            return Redirect::to('posts')->with(array('note' => 'Sorry, this post is no longer active.', 'note_type' => 'error'));
        }
    }


    /*
     * Page That shows the latest posts list
     *
     */
    public function posts()
    {   
        $page = Input::get('page');
        if( !empty($page) ){
            $page = Input::get('page');
        } else {
            $page = 1;
        }

        $data = array(
            'posts' => Post::where('active', '=', '1')->orderBy('created_at', 'DESC')->simplePaginate($this->posts_per_page),
            'current_page' => $page,
            'page_title' => 'All Posts',
            'page_description' => 'Page ' . $page,
            'menu' => Menu::orderBy('order', 'ASC')->get(),
            'pagination_url' => '/posts',
            'video_categories' => VideoCategory::all(),
            'post_categories' => PostCategory::all(),
            'theme_settings' => ThemeHelper::getThemeSettings(),
            'pages' => Page::all(),
            );

        return View::make('Theme::post-list', $data);
    }

    public function category($category)
    {
        $page = Input::get('page');
        if( !empty($page) ){
            $page = Input::get('page');
        } else {
            $page = 1;
        }

        $cat = PostCategory::where('slug', '=', $category)->first();
        $data = array(
            'posts' => Post::where('active', '=', '1')->where('post_category_id', '=', $cat->id)->orderBy('created_at', 'DESC')->simplePaginate($this->posts_per_page),
            'current_page' => $page,
            'category' => $cat,
            'page_title' => 'Posts - ' . $cat->name,
            'page_description' => 'Page ' . $page,
            'menu' => Menu::orderBy('order', 'ASC')->get(),
            'pagination_url' => '/posts/category/' . $category,
            'video_categories' => VideoCategory::all(),
            'post_categories' => PostCategory::all(),
            'theme_settings' => ThemeHelper::getThemeSettings(),
            'pages' => Page::all(),
        );

        return View::make('Theme::post-list', $data);
    }


}
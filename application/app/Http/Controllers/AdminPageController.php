<?php

use \Redirect as Redirect;

class AdminPageController extends \BaseController {

    /**
     * Display a listing of videos
     *
     * @return Response
     */
    public function index()
    {
        $pages = Page::orderBy('created_at', 'DESC')->paginate(10);
        $user = Auth::user();

        $data = array(
            'pages' => $pages,
            'user' => $user,
            'admin_user' => Auth::user()
            );

        return View::make('admin.pages.index', $data);
    }

    /**
     * Show the form for creating a new video
     *
     * @return Response
     */
    public function create()
    {
        $data = array(
            'post_route' => URL::to('admin/pages/store'),
            'button_text' => 'Add New Page',
            'admin_user' => Auth::user()
            );
        return View::make('admin.pages.create_edit', $data);
    }

    /**
     * Store a newly created video in storage.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Page::$rules);

        if ($validator->fails())
        {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        $page = Page::create($data);

        return Redirect::to('admin/pages')->with(array('note' => 'New Page Successfully Added!', 'note_type' => 'success') );
    }

    /**
     * Show the form for editing the specified video.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        $page = Page::find($id);

        $data = array(
            'headline' => '<i class="fa fa-edit"></i> Edit Page',
            'page' => $page,
            'post_route' => URL::to('admin/pages/update'),
            'button_text' => 'Update Page',
            'admin_user' => Auth::user()
            );

        return View::make('admin.pages.create_edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update()
    {
        $data = Input::all();
        $id = $data['id'];
        $page = Page::findOrFail($id);

        $validator = Validator::make($data, Page::$rules);

        if ($validator->fails())
        {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        $page->update($data);

        return Redirect::to('admin/pages/edit' . '/' . $id)->with(array('note' => 'Successfully Updated Page!', 'note_type' => 'success') );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        $page = Page::find($id);

        Page::destroy($id);

        return Redirect::to('admin/pages')->with(array('note' => 'Successfully Deleted Page', 'note_type' => 'success') );
    }


}
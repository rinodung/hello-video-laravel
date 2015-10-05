@extends('admin.master')

@section('css')
	<link rel="stylesheet" href="{{ '/application/assets/admin/css/sweetalert.css' }}">
@endsection

@section('content')

	<div class="admin-section-title">
		<div class="row">
			<div class="col-md-8">
				<h3><i class="entypo-newspaper"></i> Posts</h3><a href="{{ URL::to('admin/posts/create') }}" class="btn btn-success"><i class="fa fa-plus-circle"></i> Add New</a>
			</div>
			<div class="col-md-4">	
				<form method="get" role="form" class="search-form-full"> <div class="form-group"> <input type="text" class="form-control" name="s" id="search-input" value="<?= Input::get('s'); ?>" placeholder="Search..."> <i class="entypo-search"></i> </div> </form>
			</div>
		</div>
	</div>
	<div class="clear"></div>


	<table class="table table-striped posts-table">
		<tr class="table-header">
			<th>Post</th>
			<th>URL</th>
			<th>Active</th>
			<th>Actions</th>
			@foreach($posts as $post)
			<tr>
				<td>
				
				<a href="{{ URL::to('post') . '/' . $post->slug }}" target="_blank" class="post-link">
					<img src="<?= ImageHandler::getImage($post->image, 'small')  ?>" style="height:100px;" />
					<span>{{ TextHelper::shorten($post->title, 80) }}</span>
				</a></td>
				<td valign="bottom"><p>{{ $post->slug }}</p></td>
				<td><p>{{ $post->active }}</p></td>
				<td>
					<p>
						<a href="{{ URL::to('admin/posts/edit') . '/' . $post->id }}" class="btn btn-xs btn-info"><span class="fa fa-edit"></span> Edit</a>
						<a href="{{ URL::to('admin/posts/delete') . '/' . $post->id }}" class="btn btn-xs btn-danger delete"><span class="fa fa-trash"></span> Delete</a>
					</p>
				</td>
			</tr>
			@endforeach
	</table>

	<div class="clear"></div>

	<div class="pagination-outter"><?= $posts->appends(Request::only('s'))->render(); ?></div>
	<script src="{{ '/application/assets/admin/js/sweetalert.min.js' }}"></script>
	<script>

		$ = jQuery;
		$(document).ready(function(){
			var delete_link = '';

			$('.delete').click(function(e){
				e.preventDefault();
				delete_link = $(this).attr('href');
				swal({   title: "Are you sure?",   text: "Do you want to permanantly delete this post?",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Yes, delete it!",   closeOnConfirm: false }, function(){    window.location = delete_link });
			    return false;
			});
		});

	</script>


@stop


@extends('admin.master')

@section('content')

	<div class="admin-section-title">
		<div class="row">
			<div class="col-md-8">
				<h3><i class="entypo-user"></i> Users</h3><a href="{{ URL::to('admin/user/create') }}" class="btn btn-success"><i class="fa fa-plus-circle"></i> Add New</a>
			</div>
			<div class="col-md-4">	
				<?php $search = Input::get('s'); ?>
				<form method="get" role="form" class="search-form-full"> <div class="form-group"> <input type="text" class="form-control" name="s" id="search-input" value="@if(!empty($search)){{ $search }}@endif" placeholder="Search..."> <i class="entypo-search"></i> </div> </form>
			</div>
		</div>
	</div>
	<div class="clear"></div>


	<table class="table table-striped">
		<tr class="table-header">
			<th>Username</th>
			<th>Email</th>
			<th>User Type</th>
			<th>Active</th>
			<th>Subscription Status</th>
			<th>Actions</th>
			@foreach($users as $user)
			<tr>
				<td><a href="{{ URL::to('user') . '/' . $user->username }}" target="_blank">
					<?php if(strlen($user->username) > 40){
							echo substr($user->username, 0, 40) . '...';
						  } else {
						  	echo $user->username;
						  }
					?>
					</a>
				</td>
				<td>@if(Auth::user()->role == 'demo')email n/a in demo mode @else{{ $user->email }}@endif</td>
				<td>
					@if($user->role == 'subscriber')
						<div class="label label-success"><i class="fa fa-user"></i>
						Subscribed User</div>
					@elseif($user->role == 'demo')
						<div class="label label-danger"><i class="fa fa-life-saver"></i>
						Demo User</div>
					@elseif($user->role == 'admin')
						<div class="label label-primary"><i class="fa fa-star"></i>
						<?= ucfirst($user->role) ?> User</div>
					@endif
					 
				</td>
				<td>{{ $user->active }}</td>
				<td>
					@if( $user->onGracePeriod() )
						<div class="label label-warning"><i class="fa fa-meh-o"></i> Grace Period</div> 
					@elseif( $user->cancelled() )
						<div class="label label-danger"><i class="fa fa-frown-o"></i> Cancelled</div>
					@elseif( $user->subscribed() || ($user->role == 'admin' || $user->role == 'demo') )
						<div class="label label-success"><i class="fa fa-ticket"></i> Subscribed</div>
					@endif
					
				</td>
				<td>
					<a href="{{ URL::to('admin/user/edit') . '/' . $user->id }}" class="btn btn-xs btn-info"><span class="fa fa-edit"></span> Edit</a>
					<a href="{{ URL::to('admin/user/delete') . '/' . $user->id }}" class="btn btn-xs btn-danger delete"><span class="fa fa-trash"></span> Delete</a>
				</td>
			</tr>
			@endforeach
	</table>


	@section('javascript')

	<script>

		$ = jQuery;
		$(document).ready(function(){
			$('.delete').click(function(e){
				e.preventDefault();
				if (confirm("Are you sure you want to delete this user?")) {
			       window.location = $(this).attr('href');
			    }
			    return false;
			});
		});

	</script>

	@stop

@stop


<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title">Update Menu Item</h4>
</div>

<div class="modal-body">
	<form id="update-menu-form" accept-charset="UTF-8" action="{{ URL::to('admin/menu/update') }}" method="post">
        <label for="name">Menu Item Name</label>
        <input name="name" id="name" placeholder="Menu Item Name" class="form-control" value="{{ $menu->name }}" /><br />
        <label for="slug">URL (ex. /site/url)</label>
        <input name="url" id="url" placeholder="URL Slug" class="form-control" value="{{ $menu->url }}" <?php if($menu->type != 'none'): ?>disabled="disabled"<?php endif; ?> />
        <label for="dropdown">or Dropdown for:</label>
        <div class="clear"></div>
        <input type="radio" class="menu-dropdown-radio" name="type" value="none" @if($menu->type == 'none') checked="checked" @endif /> None
        <input type="radio" class="menu-dropdown-radio" name="type" value="videos"  @if($menu->type == 'videos') checked="checked" @endif /> Video Categories
        <input type="radio" class="menu-dropdown-radio" name="type" value="posts"  @if($menu->type == 'posts') checked="checked" @endif /> Post Categories
        <input type="hidden" name="id" id="id" value="{{ $menu->id }}" />
        <input type="hidden" name="_token" value="<?= csrf_token() ?>" />
    </form>
</div>

<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	<button type="button" class="btn btn-info" id="submit-update-menu">Update</button>
</div>

<script>
	$(document).ready(function(){
		$('#submit-update-menu').click(function(){
			$('#update-menu-form').submit();
		});

		$('#update-menu-form .menu-dropdown-radio').change(function(){
			changeNewMenuDropdownRadio($(this));
		});

	});

	function changeNewMenuDropdownRadio(object){
		if($(object).val() == 'none'){
			$('#update-menu-form #url').removeAttr('disabled');
		} else {
			$('#update-menu-form #url').attr('disabled', 'disabled');
		}
	}
</script>
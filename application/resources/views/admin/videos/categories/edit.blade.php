<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title">Update Category</h4>
</div>

<div class="modal-body">
	<form id="update-cat-form" accept-charset="UTF-8" action="{{ URL::to('admin/videos/categories/update') }}" method="post">
        <label for="name">Category Name</label>
        <input name="name" id="name" placeholder="Category Name" class="form-control" value="{{ $category->name }}" /><br />
        <label for="slug">URL slug (ex. videos/categories/slug-name)</label>
        <input name="slug" id="slug" placeholder="URL Slug" class="form-control" value="{{ $category->slug }}" />
        <input type="hidden" name="id" id="id" value="{{ $category->id }}" />
        <input type="hidden" name="_token" value="<?= csrf_token() ?>" />
    </form>
</div>

<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	<button type="button" class="btn btn-info" id="submit-update-cat">Update</button>
</div>

<script>
	$(document).ready(function(){
		$('#submit-update-cat').click(function(){
			$('#update-cat-form').submit();
		});
	});
</script>
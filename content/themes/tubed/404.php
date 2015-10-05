<?php $menu = Menu::orderBy('order', 'ASC')->get(); ?>
<?php include('includes/header.php'); ?>

<div class="container">
	<div class="col-md-10 col-md-offset-2 right-content-10">
		<h3>(404) Not found</h3>
		<p>Sorry, the page you are looking for does not exist.</p>
		<a href="<?= URL::to('/') ?>">Click here to visit the homepage</a>
	</div>
</div>
<br /><br />


<?php include('includes/footer.php'); ?>
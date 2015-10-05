<?php include('includes/header.php'); ?>

<div class="container">

	<div class="row">
		<div class="col-md-8">
			<?php if(isset($page_title)): ?>
				<h3><?= $page_title ?><?php if(isset($page_description)): ?><span><?= $page_description ?></span><?php endif; ?></h3>
			<?php endif; ?>
			<?php include('partials/page-loop.php'); ?>
		</div>
		<div class="col-md-4">
			<?php include('includes/sidebar.php'); ?>
		</div>
	</div>
	
</div>


<?php include('includes/footer.php'); ?>
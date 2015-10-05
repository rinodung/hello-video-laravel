<?php include('includes/header.php'); ?>

<div class="container">

		
		<?php if(isset($page_title)): ?>
			<h3><?= $page_title ?><?php if(isset($page_description)): ?><span><?= $page_description ?></span><?php endif; ?></h3>
		<?php endif; ?>
		<div class="row">

			<?php include('partials/video-loop.php'); ?>

		</div>


	<?php include('partials/pagination.php'); ?>

</div>


<?php include('includes/footer.php'); ?>
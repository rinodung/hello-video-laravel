<?php include('includes/header.php'); ?>

<div class="container">

		<div id="media-grid">
			<?php if(isset($page_title)): ?>
				<h3><?= $page_title ?><?php if(isset($page_description)): ?><span><?= $page_description ?></span><?php endif; ?></h3>
			<?php endif; ?>
			<div class="row">

				<?php include('partials/post-loop.php'); ?>

			</div>
		</div>

		<?php include('partials/pagination.php'); ?>

</div>


<?php include('includes/footer.php'); ?>
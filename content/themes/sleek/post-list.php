<?php include('includes/header.php'); ?>

<?php if(isset($page_title)): ?>
			
	<div class="top-header">
		<div class="container">
			<h3><?= $page_title ?><?php if(isset($page_description)): ?><span><?= $page_description ?></span><?php endif; ?></h3>
		</div>
	</div>

<?php endif; ?>

<div class="container">

		<div id="media-grid">
			<div id="headerSpace">
				<div class="row">

					<?php include('partials/post-loop.php'); ?>

				</div>
			</div>
		</div>

		<?php include('partials/pagination.php'); ?>

</div>


<?php include('includes/footer.php'); ?>
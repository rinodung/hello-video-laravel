<?php include('includes/header.php'); ?>

<h3 class="col-md-10 col-md-offset-2 right-content-10 header">Search Results for <?= $search_value; ?></h3>

<div class="col-md-offset-2 col-md-10 right-content-10 search-results">

		<?php if(count($videos) < 1): ?>
			<h5>No Video Search results found for <?= $search_value ?></h5>
		<?php else: ?>
			<h5>Video Search Results <span>for <?= $search_value ?></span></h5>
		
			<div class="row">

				<?php include('partials/video-loop.php'); ?>

			</div>

		<?php endif; ?>

		<?php if(count($posts) < 1): ?>
			<h5>No Post Search results found for <?= $search_value ?></h5>
		<?php else: ?>
			<h5>Post Search Results <span>for <?= $search_value ?></span></h5>

			<div class="row">

				<?php include('partials/post-loop.php'); ?>

			</div>
		<?php endif; ?>

</div>



<?php include('includes/footer.php'); ?>
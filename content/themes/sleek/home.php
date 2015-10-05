<?php include('includes/header.php'); ?>

<style type="text/css">
ul.video_list{
	margin:0px;
	padding:0px;
}

.video_list li{
	display:inline;
	list-style: none;
}
</style>

<div class="top-header">
	<div class="container">
		<h3><?= ThemeHelper::getThemeSetting(@$theme_settings->home_headline, 'Your Online Video Subscription Platform') ?></h3>
		<span><?= ThemeHelper::getThemeSetting(@$theme_settings->home_subheadline, 'A bit more details about your Online Video Subscription Service') ?></span>
	</div>
</div>

<div class="container">

	<div id="home-content">
		
		<div id="headerSpace">

			<div class="row">

				<?php include('partials/video-loop.php'); ?>
			
			</div>

		</div>

	</div>

	<?php include('partials/pagination.php'); ?>

</div>



<?php include('includes/footer.php'); ?>
<?php include('includes/header.php'); ?>

<style type="text/css">
#home-content{
	margin-top:545px;
}
ul.video_list{
	margin:0px;
	padding:0px;
}

.video_list li{
	display:inline;
	list-style: none;
}
</style>


<div id="home-hero">
	<div id="dim-bg">
		<div class="container home-titles">
			<h1><?= ThemeHelper::getThemeSetting(@$theme_settings->home_headline, 'Your Online Video Subscription Platform') ?></h1>
			<h4><?= ThemeHelper::getThemeSetting(@$theme_settings->homepage_subheadline, 'A bit more details about your Online Video Subscription Service') ?></h4>
			<?php if(Auth::guest()): ?>
				<button class="btn btn-primary" onClick="window.location='/signup'" href="/signup"><?= ThemeHelper::getThemeSetting(@$theme_settings->home_button_text, 'Become a Member for just $7 a month') ?></button>
			<?php else: ?>
				<button class="btn btn-primary" onClick="window.location='/videos'" href="/videos"><?= ThemeHelper::getThemeSetting(@$theme_settings->home_button_text_logged_in, 'Start Watching Videos Now') ?></button>
			<?php endif; ?>
		</div>
	</div>
</div>

<div class="container">

	<div id="home-content">
		
		<h3>Checkout our Latest Videos Below</h3>
		<div class="row">

			<?php include('partials/video-loop.php'); ?>
		
		</div>

	</div>

	<?php include('partials/pagination.php'); ?>

</div>


<script type="text/javascript" src="<?= THEME_URL . '/assets/js/jquery.bgswitcher.js'; ?>"></script>
<script>
	$(document).ready(function(){
		$("#home-hero").bgswitcher({
		  images: ["<?= THEME_URL ?>/assets/img/home/1.jpg", "<?= THEME_URL ?>/assets/img/home/2.jpg", "<?= THEME_URL ?>/assets/img/home/3.jpg", "<?= THEME_URL ?>/assets/img/home/4.jpg"], // Background images
		  effect: "fade", // fade, blind, clip, slide, drop, hide
		  interval: 4200,
		  duration:1000
		});
	});
</script>

<?php include('includes/footer.php'); ?>
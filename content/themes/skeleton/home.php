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

#home-content{
	margin-top:30px;
}
</style>

<div class="container">

	<div id="home-content">
		
		<div class="row">

			<?php include('partials/video-loop.php'); ?>
		
		</div>

	</div>

	<?php include('partials/pagination.php'); ?>

</div>



<?php include('includes/footer.php'); ?>
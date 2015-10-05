<?php foreach($videos as $video): ?>
<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
	<article class="block">
		<a class="block-thumbnail" href="<?= ($settings->enable_https) ? secure_url('video') : URL::to('video') ?><?= '/' . $video->id ?>">
			<div class="thumbnail-overlay"></div>
			<span class="play-button"></span>
			<img src="<?= ImageHandler::getImage($video->image, 'medium')  ?>">
			<div class="details">
				<h2><?= $video->title; ?></h2>
				<span><?= TimeHelper::convert_seconds_to_HMS($video->duration); ?></span>
			</div>
		</a>
		<div class="block-contents">
			<p class="date"><?= date("F jS, Y", strtotime($video->created_at)); ?>
				<?php if($video->access == 'guest'): ?>
					<span class="label label-info">Free</span>
				<?php elseif($video->access == 'subscriber'): ?>
					<span class="label label-success">Subscribers Only</span>
				<?php endif; ?>
			</p>
			<p class="desc"><?php if(strlen($video->description) > 90){ echo substr($video->description, 0, 90) . '...'; } else { echo $video->description; } ?></p>
		</div>
	</article>
</div>
<?php endforeach; ?>
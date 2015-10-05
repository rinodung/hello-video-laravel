<article class="block">
	<a class="block-thumbnail" href="<?= ($settings->enable_https) ? secure_url('video') : URL::to('video'); ?><?= '/' . $video->id ?>">
		<div class="thumbnail-overlay"></div>
		<span class="play-button-small"></span>
		<img src="<?= ImageHandler::getImage($video->image, 'medium')  ?>">
		<div class="details">
			<h2><?= $video->views; ?> View<?php if($video->views != 1): ?>s<?php endif; ?></h2>
			<span><?= TimeHelper::convert_seconds_to_HMS($video->duration); ?></span>
		</div>
	</a>
	<div class="block-contents">
		<a href="<?= ($settings->enable_https) ? secure_url('video') : URL::to('video'); ?><?= '/' . $video->id ?>"><?= $video->title; ?></a>
		<?php if($video->access == 'guest'): ?>
			<span class="type">Free Video</span>
		<?php elseif($video->access == 'subscriber'): ?>
			<span class="type">Subscribers Only</span>
		<?php endif; ?>
		<p class="desc"><?php if(strlen($video->description) > 90){ echo substr($video->description, 0, 78) . '...'; } else { echo $video->description; } ?></p>
		
	</div>
	<!--p class="type"><?php if($video->access == 'guest'): ?>
			<span class="label label-info">Free Video</span>
		<?php elseif($video->access == 'subscriber'): ?>
			<span class="label label-success">Subscribers Only</span>
		<?php endif; ?></p-->
</article>
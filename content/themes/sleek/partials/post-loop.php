<?php foreach($posts as $post): ?>

<?php $post_description = preg_replace('/^\s+|\n|\r|\s+$/m', '', strip_tags($post->body)); ?>

<div class="col-lg-3 col-md-4 col-sm-4 col-xs-6">
	<article class="block">
		<a class="block-thumbnail" href="<?= ($settings->enable_https) ? secure_url('post') : URL::to('post'); ?><?= '/' . $post->slug ?>">
			<div class="thumbnail-overlay"></div>
			<img src="<?= ImageHandler::getImage($post->image, 'medium')  ?>">
			<div class="details">
				<h2><?= $post->title; ?></h2>
				<span><?= TimeHelper::convert_seconds_to_HMS($post->duration); ?></span>
			</div>
		</a>
		<div class="block-contents">
			<p class="date"><?= date("F jS, Y", strtotime($post->created_at)); ?></p>
			<p class="desc"><?php if(strlen($post_description) > 90){ echo substr($post_description, 0, 90) . '...'; } else { echo $post->description; } ?></p>
		</div>
	</article>
</div>
<?php endforeach; ?>
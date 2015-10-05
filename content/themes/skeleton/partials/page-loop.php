<ul class="pages">
	<?php foreach($pages as $page): ?>
		<li>
			<a href="<?= ($settings->enable_https) ? secure_url('page') : URL::to('page') ?><?= '/' . $page->slug; ?>"><h2><?= $page->title; ?></h2></a>
		</li>
	<?php endforeach; ?>
</ul>
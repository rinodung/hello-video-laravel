<?php

if(isset($videos)):
	$media = $videos;
elseif(isset($posts)):
	$media = $posts;
endif;


?>

<div class="pagination">
	<?php if($current_page != 1) : ?>
		<a class="previous_page" href="<?= $pagination_url . '/?page=' . intval($current_page - 1); ?>">Prev Page</a>
	<?php endif; ?>
	<?php if($media->hasMorePages()) : ?>
		<a class="next_page" href="<?= $pagination_url . '/?page=' . intval($current_page + 1); ?>">Next Page</a>
	<?php endif; ?>
</div>
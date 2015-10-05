@extends('admin.master')

@section('content')

<div id="admin-container">
<!-- This is where -->
	
	<div class="admin-section-title">
		<h3><i class="entypo-monitor"></i> Themes</h3> 
	</div>
	<div class="clear"></div>
	<div class="gallery-env">
	
		<div class="row">
		<?php foreach($themes as $theme): ?>

			<div class="col-sm-6 col-md-4">
					
					<article class="album">
						
						<header>
							
								<img src="/content/themes/<?= $theme->slug ?>/thumbnail.jpg" />
							
						</header>
						
						
						
						<footer>
							
							<div class="album-images-count">
								<i class="entypo-monitor"></i>
								{{ $theme->name }}<span style="margin-left:8px; font-size:8px; line-height:17px; float:right; display:block">version {{ $theme->version }}</span>
							</div>
							
							<div class="album-options">
								<?php if($active_theme == $theme->slug): ?>
									<a href="" onclick="return false;" style="background:#98cb00; color:#fff; cursor:default;">
										<i class="fa fa-check"></i> Active
									</a>
								<?php else: ?>
									<a href="{{ URL::to('admin/theme/activate') . '/' . $theme->slug }}">
										Activate
									</a>
								<?php endif; ?>
								
							</div>
							
						</footer>
						
					</article>
					
				</div>

	    <?php endforeach; ?>
	    </div>
	</div>

</div><!-- admin-container -->

@stop
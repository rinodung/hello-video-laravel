<?php include('includes/header.php'); ?>


	<div class="container">

		<div class="row">

			<div class="col-md-8 post">
				
				<div class="post-img">
					<img src="<?= ImageHandler::getImage($post->image)  ?>" style="width:100%;" />
					<h3><?= $post->title ?></h3>
					<h6><?php if(isset($author->username)){ echo  'by ' . $author->username; } ?> on <?= date("F j, Y, g:i a", strtotime($post->created_at)); ?></h6>
				</div>

				<div class="post-body">

					<?php if($post->access == 'guest' || ($post->access == 'subscriber' && !Auth::guest() && Auth::user()->subscribed()) || (!Auth::guest() && (Auth::user()->role == 'demo' || Auth::user()->role == 'admin')) ): ?>

						<?= $post->body ?>

					<?php else: ?>
					
						<div class="post-guest">
							
							<div class="post-guest-content">
								<?= $post->body_guest ?>
								<div class="white-fade"></div>
							</div>

							<div id="subscribers_only">
								<h2>Sorry, this full post is only available to Subscribers</h2>
								<div class="clear"></div>
								<form method="get" action="/signup">
									<button id="button">Signup Now to Become a Subscriber</button>
								</form>
							</div>

						</div>

					<?php endif; ?>
				
				</div>

				<div class="clear"></div>
				<div id="social_share">
			    	<p>Share This Article:</p>
					<?php include('partials/social-share.php'); ?>
				</div>

				<div class="clear"></div>

				<?php if($post->access == 'guest' || ($post->access == 'subscriber' && !Auth::guest()) ): ?>
					
					<div id="comments">
						<div id="disqus_thread"></div>
					</div>

				<?php endif; ?>

			</div>

			<div class="col-md-4">
				<?php include('includes/sidebar.php'); ?>
			</div>

		</div>
    

	</div>


	
		
	<script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = '<?= ThemeHelper::getThemeSetting(@$theme_settings->disqus_shortname, 'hellovideo') ?>';

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
    <noscript>Please enable JavaScript to view the comments</noscript>    
    <script src="<?= THEME_URL . '/assets/js/rrssb.min.js'; ?>"></script>


<?php include('includes/footer.php'); ?>
<?php

// DEFINE THE THEME_URL
if( ! defined ( "THEME_URL" ) ):
	define("THEME_URL", '/content/themes/' . basename(__DIR__) );
endif;

/********** FUNCTION FOR GENERATING THE MENU **********/

if(!function_exists('generate_menu')):

	function generate_menu($menu){
		$previous_item = array();
		$first_parent_id = 0;
		$depth = 0;
		$output = '';
		
		foreach($menu as $menu_item):

			$hasChildren = $menu_item->hasChildren();

			if( (isset($previous_item->id) && $menu_item->parent_id == $previous_item->parent_id) || $menu_item->parent_id == NULL ):
				$output .= '</li>';
		 	endif;

			if( (isset($previous_item->parent_id) && $previous_item->parent_id !== $menu_item->parent_id) && $previous_item->id != $menu_item->parent_id ):
				if($depth == 2):
					$output .=	'</li></ul>';
					$depth -= 1;
				endif;
			
				if($depth == 1 && $menu_item->parent_id == $first_parent_id):
					$output .= '</li></ul>';
					$depth -= 1;
				endif;
			
			endif;
			

			if($menu_item->type == 'videos'):

				$active = '';
				if(Request::is('videos')){
					$active = ' active';
				}

				$output .= '<li class="dropdown' . $active . '">';
					$output .= '<a href="/videos" class="dropdown-toggle">' . $menu_item->name . ' <span class="caret"></span></a>';
					
						$output .= '<ul class="dropdown-menu multi-level" role="menu">';
						$output .= generate_video_post_menu(VideoCategory::orderBy('order', 'ASC')->get(), '/videos/category/');
					
					$output .= '</li></ul>';
				
				$output .= '</li>';
				continue; 
			endif;

			if($menu_item->type == 'posts'):

				$active = '';
				if(Request::is('posts')){
					$active = ' active';
				}

				$output .= '<li class="dropdown' . $active . '">';
					$output .= '<a href="/posts" class="dropdown-toggle">' . $menu_item->name . ' <span class="caret"></span></a>';
					
						$output .= '<ul class="dropdown-menu multi-level" role="menu">';
						$output .= generate_video_post_menu(PostCategory::orderBy('order', 'ASC')->get(), '/posts/category/');
					
					$output .= '</li></ul>';
				
				$output .= '</li>';
				continue; 
			endif;


				$li_class = '';
				$caret = '';
				$dropdown_toggle = '';
				if($hasChildren):
					$dropdown_toggle = ' class="dropdown-toggle"';
				endif;
				if($hasChildren && $depth == 0):

					if(Request::is(str_replace('/', '', $menu_item->url)) ):
						$li_class .= ' class="active dropdown"';
					else:
						$li_class .= ' class="dropdown"';
					endif;

					$caret = ' <span class="caret"></span>';
				elseif($hasChildren && $depth > 0):
					$li_class .= ' class="dropdown-submenu"';
				endif;

				if((!$hasChildren && $depth == 0 && Request::is(str_replace('/', '', $menu_item->url)) ) || ($menu_item->url == '/' && Request::is('/') ) ):
					$li_class .= ' class="active"';
				endif;

				$output .= '<li'. $li_class . '>';

				$output .= '<a href="' . $menu_item->url .'"' . $dropdown_toggle . '>' . $menu_item->name . $caret . '</a>';

				if($hasChildren):
					$output .= '<ul class="dropdown-menu multi-level" role="menu">';
					$depth += 1;
				endif;

				$previous_item = $menu_item;

			endforeach;
			
			$output .= '</li></ul>';
		
		return $output;

	}

endif;


/********** FUNCTION FOR GENERATING Video and Post Category MENU **********/

if(!function_exists('generate_video_post_menu')):

	function generate_video_post_menu($menu, $link_prefix = '/'){
		$previous_item = array();
		$first_parent_id = 0;
		$depth = 0;
		$output = '';
		
		foreach($menu as $menu_item):

				$hasChildren = $menu_item->hasChildren();

				if( (isset($previous_item->id) && $menu_item->parent_id == $previous_item->parent_id) || $menu_item->parent_id == NULL ):
					$output .= '</li>';
			 	endif;

				if( (isset($previous_item->parent_id) && $previous_item->parent_id !== $menu_item->parent_id) && $previous_item->id != $menu_item->parent_id ):
					if($depth == 2):
						$output .=	'</li></ul>';
						$depth -= 1;
					endif;
				
					if($depth == 1 && $menu_item->parent_id == $first_parent_id):
						$output .= '</li></ul>';
						$depth -= 1;
					endif;
				
				endif;

				$li_class = '';
				$dropdown_toggle = '';
				if($hasChildren):
					$dropdown_toggle = ' class="dropdown-toggle"';
					$li_class .= ' class="dropdown-submenu"';
				endif;
		

				$output .= '<li'. $li_class . '>';

				$output .= '<a href="' . $link_prefix . $menu_item->slug .'"' . $dropdown_toggle . '>' . $menu_item->name . '</a>';

				if($hasChildren):
					$output .= '<ul class="dropdown-menu multi-level" role="menu">';
					$depth += 1;
				endif;

				$previous_item = $menu_item;

			endforeach;

			if( (isset($previous_item->id) && $menu_item->parent_id == $previous_item->parent_id) ):
				if( $menu_item->parent_id != NULL ):
					$output .= '</ul>';
				endif; 
			endif; 
		
		return $output;

	}

endif;



/********** FUNCTION to ADJUST BRIGHTNESS OF A HEX VALUE **********/

if(!function_exists ( 'adjustBrightness' )):
    function adjustBrightness($hex, $steps) {
        // Steps should be between -255 and 255. Negative = darker, positive = lighter
        $steps = max(-255, min(255, $steps));
        // Format the hex color string
        $hex = str_replace('#', '', $hex);
        if (strlen($hex) == 3) {
            $hex = str_repeat(substr($hex,0,1), 2).str_repeat(substr($hex,1,1), 2).str_repeat(substr($hex,2,1), 2);
        }
        // Get decimal values
        $r = hexdec(substr($hex,0,2));
        $g = hexdec(substr($hex,2,2));
        $b = hexdec(substr($hex,4,2));
        // Adjust number of steps and keep it inside 0 to 255
        $r = max(0,min(255,$r + $steps));
        $g = max(0,min(255,$g + $steps));  
        $b = max(0,min(255,$b + $steps));
        $r_hex = str_pad(dechex($r), 2, '0', STR_PAD_LEFT);
        $g_hex = str_pad(dechex($g), 2, '0', STR_PAD_LEFT);
        $b_hex = str_pad(dechex($b), 2, '0', STR_PAD_LEFT);
        return '#'.$r_hex.$g_hex.$b_hex;
    } 
endif;

if(!function_exists ( 'dynamic_styles' )):
	function dynamic_styles($theme_settings){
		$hex_color = ThemeHelper::getThemeSetting(@$theme_settings->color, '');
		if(empty($hex_color)){
			$hex_color = '#707681';
		}

		$color = $hex_color;
		$lighter_color = adjustBrightness($hex_color, 20);
		
		$style = "";
		$style .= ".theme_color_background, #signup-form .panel-heading, .post .post-img h3, #home-hero button, .block .block-contents p.date .label.label-success, .btn.btn-primary, .navbar-nav.navbar-right li.signup-desktop a, .vjs-default-skin .vjs-play-progress, .vjs-default-skin .vjs-volume-level, #subscribers_only button{ background: $color; }";
		$style .= ".btn.btn-primary, .form-control:focus{ border-color:$color; }";
		$style .= ".post .post-img h6, #home-hero button:hover{ background: $lighter_color; }";
		$style .= ".theme_color, a, .page a, footer ul li a, .home footer ul li a{ color:$color; }";
		$style .= "footer ul li a:hover, .home footer ul li a:hover{ color:$lighter_color; }";

		return $style;

	}
endif;

?>
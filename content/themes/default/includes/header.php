<!DOCTYPE html>
<html>
<head>
	
    <?php include('head.php'); ?>

</head>
<body <?php if(Request::is('/')) echo 'class="home"'; ?>>

<nav class="navbar navbar-default navbar-static-top" role="navigation">
      <div class="container">
        
            <div class="navbar-header">
              <a id="nav-toggle" href="#"><span></span></a>

              <?php $logo = (!empty($settings->logo)) ? Config::get('site.uploads_dir') . 'settings/' . $settings->logo : THEME_URL . '/assets/img/logo.png'; ?>
              <a href="/" class="navbar-brand"><img src="<?= $logo ?>" /></a>
            </div>


            <div class="collapse navbar-collapse right" id="bs-example-navbar-collapse-1">

                <ul class="nav navbar-nav navbar-left">
                    <li><a href="/videos"><i class="hv-video"></i> Videos</a></li>
                    <li><a href="/posts"><i class="hv-book"></i> Articles</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    
                    <?php if(Auth::guest()): ?>
                        
                        <li class="login-desktop"><a href="/login"><i class="fa fa-lock"></i> Login</a></li>
                        <li class="signup-desktop"><a href="/signup"> Signup</a></li>
                    
                    <?php else: ?>
                        
                        <li class="dropdown">
                            <a href="#_" class="user-link-desktop dropdown-toggle" data-toggle="dropdown"><img src="<?= Config::get('site.uploads_dir') . 'avatars/' . Auth::user()->avatar ?>" class="img-circle" /> <?= ucwords(Auth::user()->username) ?> <i class="fa fa-chevron-down"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="<?= ($settings->enable_https) ? secure_url('user') : URL::to('user') ?><?= '/' . Auth::user()->username; ?>">My Profile</a></li>
                                <li><a href="<?= ($settings->enable_https) ? secure_url('favorites') : URL::to('favorites') ?>">My Favorites</a></li>
                                
                                <?php if(Auth::user()->role == 'admin' || Auth::user()->role == 'demo'): ?>
                                    <li class="divider"></li>
                                    <li><a href="<?= ($settings->enable_https) ? secure_url('admin') : URL::to('admin') ?>"> Admin</a></li>
                                <?php endif; ?>
                                <li class="divider"></li>
                                <li><a href="<?= ($settings->enable_https) ? secure_url('logout') : URL::to('logout') ?>" id="user_logout_mobile"><i class="fa fa-power-off"></i> Logout</a></li>
                            </ul>
                        </li>
                        
                    <?php endif; ?>
                </ul>

                <!--form class="navbar-form navbar-right search" role="search"><div class="form-search search-only"><i class="fa fa-search"></i> <input class="form-control search-query" placeholder="search..."></div></form-->

            </div>

         </div>

      </div>
    </nav>
    
    <div class="clear"></div>
    <nav class="navbar navbar-default navbar-static-top second-nav">
        <div class="container">
            
            
            <div id="mobile-subnav"><i class="fa fa-bars"></i> Open Submenu</div>
            <ul class="navbar-right">
                <li>
                    <div id="navbar-search-form">
                        <form role="search" action="/search" method="GET">
                            <i class="fa fa-search"></i>
                            <input type="text" id="value" name="value" placeholder="Search...">

                           
                        </form>
                    </div>
                </li>
            </ul>
            <div class="row main-nav-row">
                <?php include('menu.php'); ?>
            </div>
        </div>
    </nav>
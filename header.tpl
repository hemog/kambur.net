<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    {include file="$template/includes/head.tpl"}
    {$headoutput}
</head>

<body data-phone-cc-input="{$phoneNumberInputStyle}">
{$headeroutput}
       
<!-- REMOVE THIS SECTION IF YOU DON'T WANT TO USE WHMCS MENU -->
     {if $loggedin}
         <nav id="nav" class="navbar navbar-default navbar-main" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#primary-nav">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="primary-nav">
                <ul class="nav navbar-nav">

                </ul>
                <ul class="nav navbar-nav navbar-right">

                 {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}

                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </nav>
 {/if}
 <!-- WHMCS MENU ENDS HERE -->
        <!-- Start of topbar -->
    <div class="top-bar margin-for-home">
        <div class="custom-width">
            <div class="left-topbar aligment-for-home">
                <p></p>
            </div>
            <div class="right-topbar">
            <a class="hidden-xs"> <i class="fa fa-envelope"></i> support@kambur.net </a>
            {if $languagechangeenabled && count($locales) > 1}
                <li>
                    <a href="#" class="choose-language" data-toggle="popover" id="languageChooser">
                        {$activeLocale.localisedName}
                        <b class="caret"></b>
                    </a>
                    <div id="languageChooserContent" class="hidden">
                        <ul>
                            {foreach $locales as $locale}
                                <li>
                                    <a href="{$currentpagelinkback}language={$locale.language}">{$locale.localisedName}</a>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </li>
            {/if}
         </ul>
        <ul class="top-nav">
            {if $loggedin}
                <li>
                    <a href="#" data-toggle="popover" id="accountNotifications" data-placement="bottom">
                        {$LANG.notifications}
                        {if count($clientAlerts) > 0}
                            <span class="label label-info">{lang key='notificationsnew'}</span>
                        {/if}
                        <b class="caret"></b>
                    </a>
                    <div id="accountNotificationsContent" class="hidden">
                        <ul class="client-alerts">
                        {foreach $clientAlerts as $alert}
                            <li>
                                <a href="{$alert->getLink()}">
                                    <i class="fas fa-fw fa-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}exclamation-triangle{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if}"></i>
                                    <div class="message">{$alert->getMessage()}</div>
                                </a>
                            </li>
                        {foreachelse}
                            <li class="none">
                                {$LANG.notificationsnone}
                            </li>
                        {/foreach}
                        </ul>
                    </div>
                </li>
                <!--
                <li class="primary-action">
                    <a href="{$WEB_ROOT}/logout.php" class="btn">
                        {$LANG.clientareanavlogout}
                    </a>
                </li>
                -->
                    {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar}
            {else}
                <li>
                <i class="fa fa-user"></i>
                {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar}
                </li>
            {/if}
            {if $adminMasqueradingAsClient || $adminLoggedIn}
                <li>
                    <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="btn btn-logged-in-admin" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{$LANG.adminmasqueradingasclient} {$LANG.logoutandreturntoadminarea}{else}{$LANG.adminloggedin} {$LANG.returntoadminarea}{/if}">
                        <i class="fas fa-sign-out-alt"></i>
                    </a>
                </li>
            {/if}
            
        </ul>
            </div>
        </div>
    </div>
    <!-- End of topbar -->

    <!-- Navbar content -->
    <nav class="navbar navbar-default dark navbar-sticky no-background bootsnav">
        <!-- Start Top Search -->
        <div class="top-search">
            <div class="container">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </div>
        <!-- End Top Search -->
        <div class="custom-width">
            <!-- Start Atribute Navigation -->
            <div class="attr-nav">
                <ul>
                <li class="primary-action">
                    <a href="{$WEB_ROOT}/cart.php?a=view">
                         <i class="fa fa-shopping-bag"></i>
                            <span class="badge"></span>
                        <span class="cart-text">{$LANG.viewcart}</span>
                    </a>
                </li>
                    <li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>
                </ul>
            </div>
            <!-- End Atribute Navigation -->

            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand aligment-for-home" href="index.php"><img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/logo/logo.png" class="logo" alt=""></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav navbar-right" data-in="fadeIn" data-out="fadeOut">
                    <li class="dropdown">
                        <a href="#" class="active" >Anasayfa</a>
                        
                    </li>
                    <li class="dropdown megamenu-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Hizmetlerimiz</a>
                        <ul class="dropdown-menu megamenu-content" role="menu">
                            <li>
                                <div class="row">
                                    <div class="col-menu col-md-3">
                                        <h6 class="title"><i class="fa fa-server"></i> Shared Hosting</h6>
                                        <div class="content">
                                            <p>It is a long established fact that a reader will be distracted by the
                                                readable content.</p>
                                            <h4 class="menu-price">Starting from $2.95</h4>
                                            <a href="#" class="navbar-btn">See all offers</a>
                                        </div>
                                    </div><!-- end col-3 -->
                                    <div class="col-menu col-md-3">
                                        <h6 class="title"><i class="fas fa-cloud-download-alt"></i> Proxy</h6>
                                        <div class="content">
                                            <ul class="menu-col">
                                                <li><a href="#">Mobil Proxy <span class="badge-link">3G</span></a></li>
                                                <li><a href="#">Mobil Proxy <span class="badge-link">4.5G</span></a></li>
                                                <li><a href="#">ISP Proxy</a></li>
                                                <li><a href="#">Rotating Proxy</a></li>
                                                <li><a href="#">Datacenter Proxy</a></li>
                                            </ul>
                                        </div>
                                    </div><!-- end col-3 -->
                                    <div class="col-menu col-md-3">
                                        <h6 class="title"><i class="fas fa-tachometer-alt"></i> Sunucu</h6>
                                        <div class="content">
                                            <ul class="menu-col">
                                                <li><a href="#">Sanal Sunucu<span class="badge-link">TR</span></a></li>
                                                <li><a href="#">Sanal Sunucu<span class="badge-link">DE</span></a></li>
                                                <li><a href="#">Sanal Sunucu<span class="badge-link">FR</span></a></li>
                                                <li><a href="#">Kiralık Sunucu <span class="badge-link">TR</span></a></li>
                                                
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-menu col-md-3">
                                        <h6 class="title"><i class="fa fa-rocket"></i> Hosting</h6>
                                        <div class="content">
                                            <ul class="menu-col">
                                                <li><a href="#">Paylaşımlı Hosting</a></li>
                                                <li><a href="#">Bayii Hosting </li></a></li>
                                                <li><a href="#">Wordpress Hosting</a></li>
                                                <li><a href="#">E-ticaret Hosting</a></li>
                                                
                                            </ul>
                                        </div>
                                    </div><!-- end col-3 -->
                                </div><!-- end row -->
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Kurumsal</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Hakkımızda</a></li>
                            <li><a href="#">Banka Hesap Bilgilerimiz</a></li>
                            <li><a href="#">Satış Sözleşmesi</a></li>
                            <li><a href="#">Hizmet Sözleşmesi</a></li>
                            
                        </ul>
                    </li>
                    
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
        <!-- Start Side Menu -->
        <div class="side">
            <a href="#" class="close-side"><i class="fa fa-times"></i></a>
            <div class="widget">
                <h6 class="title">About Us</h6>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page
                    when looking at its layout. The point of using Lorem Ipsum is that it a more-or-less normal point
                    of using Lorem Ipsum.</p>
            </div>
            <div class="widget">
                <h6 class="title">Contact Us</h6>
                <ul class="link">
                    <li><i class="fa fa-envelope"></i> hello@yourname.com</li>
                    <li><i class="fa fa-phone"></i> +1 (33) 4456 889</li>
                    <li><a href="#"><i class="fa fa-comments"></i>Livechat</a></li>
                </ul>
            </div>
            <div class="widget">
                <h6 class="title">Social Pages</h6>
                <div class="social-links">
                    <a href="#"> <i class="fab fa-facebook-f"></i></a>
                    <a href="#"> <i class="fab fa-google"></i></a>
                    <a href="#"> <i class="fab fa-linkedin-in"></i></a>
                    <a href="#"> <i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <!-- End Side Menu -->
    </nav>
    <!-- Navbar Content ends here -->

{if $templatefile == 'homepage'}
        <!-- Home Page Carousel -->
    <div class="home-carousel">
        <!-- Left sidebar -->
        <div class="left-sidebar">
            <div class="contact-links link-style">
                <a data-toggle="modal" data-target="#myModal"><i class="fas fa-phone"></i></a>
                <a data-toggle="modal" data-target="#myModal"><i class="far fa-envelope-open"></i></a>
                <a data-toggle="modal" data-target="#myModal"><i class="far fa-comments"></i>
                    <div class="notification">+</div>
                </a>
            </div>
            <div class="sidebar-socials link-style">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
        <!-- MODAL  -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-sm">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Please feel free to contact us</h4>
                    </div>
                    <div class="modal-body">
                        <div class="modal-contact">
                            <i class="fa fa-phone"></i>
                            <h4>+1 (33) 456 5566</h4>
                        </div>
                        <div class="modal-contact">
                            <i class="fa fa-envelope"></i>
                            <h4>hello@youremail.com</h4>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-blue btn-small" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- end of modal -->

        <!-- Left Sidebar ends here -->
        <div class="custom-width">
            <div class="row">
                <div class="tab-content">
                    <div id="wordpress" class="tab-pane fade in active">
                        <div class="col-sm-6">
                            <div class="text-container">
                                <div class="home-title animated fadeInLeft">
                                    <h2>Powerful Website Hosting</h2>
                                    <h4 class="animation-text">Starting at
                                        $19.99/monthly</h4>
                                    <p>It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it a more-or-less normal point of using Lorem Ipsum.</p>
                                    <div class="buttons">
                                        <a href="#" class="btn btn-medium btn-green btn-shadow">Start a free trial</a>
                                        <p>*No Credit Card Rquired</p>
                                    </div>
                                </div>
                                <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/world2.png" class=" img-absolute" alt="">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="img-container">
                                <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/home-carousel.png" class="img-responsive animated fadeInRight"
                                    alt="">
                            </div>
                        </div>
                    </div>
                    <div id="cloud" class="tab-pane">
                        <div class="col-sm-6">
                            <div class="text-container">
                                <div class="home-title animated fadeInLeft">
                                    <h2>Cloud Computing Services</h2>
                                       <h4 class="animation-text">Starting at
                                        $19.99/monthly</h4>
                                    <p>It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it a more-or-less normal point of using Lorem Ipsum.</p>
                                    <div class="buttons">
                                        <a href="#" class="btn btn-medium btn-green">Start a free trial</a>
                                        <p>*No Credit Card Rquired</p>
                                    </div>
                                </div>
                                 <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/world2.png" class=" img-absolute" alt="">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="img-container">
                                <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/server2.png" class="img-responsive animated fadeInRight"
                                    alt="">
                            </div>
                        </div>
                    </div>
                    <div id="dedicated" class="tab-pane fade">
                        <div class="col-sm-6">
                            <div class="text-container">
                                <div class="home-title animated fadeInLeft">
                                    <h2>Business Shared Hosting</h2>
                                        <h4 class="animation-text">Starting at
                                        $19.99/monthly</h4>
                                    <p>It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it a more-or-less normal point of using Lorem Ipsum.</p>
                                    <div class="buttons">
                                        <a href="#" class="btn btn-medium btn-green">Start a free trial</a>
                                        <p>*No Credit Card Rquired</p>
                                    </div>
                                </div>
                                 <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/world2.png" class=" img-absolute" alt="">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="img-container">
                                <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/green-energy.png" class="img-responsive animated fadeInRight"
                                    alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="tabs-switcher animated fadeInUp">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a data-toggle="tab" href="#wordpress">Wordpress Hosting</a>
                                </li>
                                <li><a data-toggle="tab" href="#cloud">Cloud Computing</a></li>
                                <li><a data-toggle="tab" href="#dedicated">Shared Hosting</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Home Page Carousel -->

    

    <!-- Pricing Tables -->
    <div class="pricing-tables padding-top50 padding-bottom50">
        <div class="custom-width">
            <div class="row">
                <div class="main-title text-center">
                    <h2>Check out our latest web hosting offers</h2>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page
                        when looking at its layout will be distracted. </p>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="price">19.99$/month</div>
                    <div class="table mobile-margin-bottom">
                        <div class="table-img">
                            <img data-aos="fade-up" src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/rocket.png" class="img-center img-responsive"
                                alt="Wordpress Hosting">
                        </div>
                        <div class="table-content">
                            <h4>Wordpress Server</h4>
                            <p>It is a long established fact that a reader will be distracted</p>
                            <div class="table-list">
                                <ul>
                                    <li><i data-aos="zoom-in" class="fa fa-plus"></i> Fully Customized Servers</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="50" class="fa fa-plus"></i> Multi Core
                                        and Turbo Speed</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="100" class="fa fa-plus"></i> Unlimited
                                        SDD Space </li>
                                    <li><i data-aos="zoom-in" data-aos-delay="150" class="fa fa-times"></i> Unlimited
                                        MySQL Databases</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="200" class="fa fa-times"></i>Multi CPU
                                        and Ultra Speed</li>
                                </ul>
                            </div>
                            <div class="buttons">
                                <a href="#" class="btn btn-gray btn-medium"> Purchase Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="price green-bg mobile-margin-top">29.99$/month</div>
                    <div class="table">
                        <div class="table-img">
                            <img data-aos="fade-up" data-aos-delay="100" src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/rocket2.png" class="img-center img-responsive"
                                alt="Wordpress Hosting">
                        </div>
                        <div class="table-content">
                            <h4>Cloud Hosting</h4>
                            <p>It is a long established fact that a reader will be distracted</p>
                            <div class="table-list">
                                <ul>
                                    <li><i data-aos="zoom-in" class="fa fa-plus"></i> Fully Customized Servers</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="50" class="fa fa-plus"></i> Multi Core
                                        and Turbo Speed</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="100" class="fa fa-plus"></i> Unlimited
                                        SDD Space</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="150" class="fa fa-times"></i> Unlimited
                                        MySQL Databases</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="200" class="fa fa-times"></i>Multi CPU
                                        and Ultra Speed</li>
                                </ul>
                            </div>
                            <div class="buttons">
                                <a href="#" class="btn btn-gray btn-medium"> Purchase Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="price price-margin-top">59.99$/month</div>
                    <div class="table">
                        <div class="table-img">
                            <img data-aos="fade-up" data-aos-delay="200" src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/rocket3.png" class="img-center img-responsive"
                                alt="Wordpress Hosting">
                        </div>
                        <div class="table-content">
                            <h4>Dedicated Hosting</h4>
                            <p>It is a long established fact that a reader will be distracted</p>
                            <div class="table-list">
                                <ul>
                                    <li><i data-aos="zoom-in" class="fa fa-plus"></i> Fully Customized Servers</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="50" class="fa fa-plus"></i> Multi Core
                                        and Turbo Speed</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="100" class="fa fa-plus"></i> Unlimited
                                        SDD Space</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="150" class="fa fa-times"></i> Unlimited
                                        MySQL Databases</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="200" class="fa fa-times"></i>Multi CPU
                                        and Ultra Speed</li>
                                </ul>
                            </div>
                            <div class="buttons">
                                <a href="#" class="btn btn-gray btn-medium"> Purchase Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="price price-margin-top">59.99$/month</div>
                    <div class="table">
                        <div class="table-img">
                            <img data-aos="fade-up" data-aos-delay="300" src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/rocket4.png" class="img-center img-responsive"
                                alt="Wordpress Hosting">
                        </div>
                        <div class="table-content">
                            <h4>Dedicated Hosting</h4>
                            <p>It is a long established fact that a reader will be distracted</p>
                            <div class="table-list">
                                <ul>
                                    <li><i data-aos="zoom-in" class="fa fa-plus"></i> Fully Customized Servers</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="50" class="fa fa-plus"></i> Multi Core
                                        and Turbo Speed</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="100" class="fa fa-plus"></i> Unlimited
                                        SDD Space</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="150" class="fa fa-times"></i> Unlimited
                                        MySQL Databases</li>
                                    <li><i data-aos="zoom-in" data-aos-delay="200" class="fa fa-times"></i>Multi CPU
                                        and Ultra Speed</li>
                                </ul>
                            </div>
                            <div class="buttons">
                                <a href="#" class="btn btn-gray btn-medium"> Purchase Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Pricing Tables content ends here -->

    <!-- Separated Section -->
    <div class="dual-section padding-top50 padding-bottom50">
        <div class="custom-width">
            <div class="row">
                <div class="main-title title-white text-center">
                    <h2>Transfer your web site to Bluerack</h2>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page
                        when looking at its layout. </p>
                </div>
                <div class="col-sm-6">
                    <div class="left-content">
                        <div class="features">
                            <i class="fa fa-server pull-left" data-aos="zoom-in"></i>
                            <div class="text">
                                <h4>Fully Managed Business Hosting Servers</h4>
                                <p>It is a long established fact that a reader will be distracted by the readable that
                                    a reader will be distrac</p>
                            </div>
                        </div>
                        <div class="features">
                            <i class="fa fa-microchip pull-left" data-aos="zoom-in" data-aos-delay="100"></i>
                            <div class="text">
                                <h4>Latest Intel Xenon Processors</h4>
                                <p>It is a long established fact that a reader will be distracted by the readable that
                                    a reader will be distrac</p>
                            </div>
                        </div>
                        <div class="features">
                            <i class="fa fa-hdd pull-left" data-aos="zoom-in" data-aos-delay="200"></i>
                            <div class="text">
                                <h4>Unlimited space based on SSD Disc</h4>
                                <p>It is a long established fact that a reader will be distracted by the readable that
                                    a reader will be distrac</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="right-content">
                        <div class="features">
                            <i class="fab fa-wordpress pull-left" data-aos="zoom-in"></i>
                            <div class="text">
                                <h4>Fully Managed Wordpress Hosting Servers</h4>
                                <p>It is a long established fact that a reader will be distracted by the readable that
                                    a reader will be distrac</p>
                                <p></p>
                            </div>
                        </div>
                        <div class="features">
                            <i class="fa fa-rocket pull-left" data-aos="zoom-in" data-aos-delay="100"></i>
                            <div class="text">
                                <h4>Light Speed Servers and Internet</h4>
                                <p>It is a long established fact that a reader will be distracted by the readable that
                                    a reader will be distrac</p>
                                <p></p>
                            </div>
                        </div>
                        <div class="features">
                            <i class="fa fa-envelope pull-left" data-aos="zoom-in" data-aos-delay="200"></i>
                            <div class="text">
                                <h4>Unlimited Free Premium Support</h4>
                                <p>It is a long established fact that a reader will be distracted by the readable that
                                    a reader will be distrac</p>
                                <p></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Separated Section ends here-->

    <!-- Tab switcher -->
    <div class="tabs padding-bottom30">
        <div class="hosting-tabs">
            <ul class="nav nav-tabs">
                <li class="active">
                    <div class="arrow-down">
                        <div class="arrow-down-inner"></div>
                    </div>
                    <a data-toggle="tab" href="#home">Wordpress Hosting</a>
                </li>
                <li><a data-toggle="tab" href="#menu1">Dedicated Servers</a></li>
                <li><a data-toggle="tab" href="#menu2">Cloud Computing</a></li>
                <li><a data-toggle="tab" href="#menu3">E-commerce Hosting</a></li>
            </ul>
        </div>
        <div class="custom-width">
            <div class="row">
                <div class="tab-content">
                    <div id="home" class="tab-pane in active">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/green-energy.png" class="img-responsive animated fadeInLeft"
                                alt="Wordpress Hosting">
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="text animated fadeInRight">
                                <div class="tab-title">
                                    <h3>World's largest web hosting company</h3>
                                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatemSed ut
                                        perspiciatis unde omnis iste natus error sit voluptatem</p>
                                </div>
                                <div class="tab-lists">
                                    <div class="host-feature">
                                        <i class="fa fa-check pull-left" data-aos="zoom-in"></i>
                                        <div class="text">
                                            <h4>Fully Managed with unlimited Bandwidth</h4>
                                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem omnis
                                            </p>
                                        </div>
                                    </div>
                                    <div class="host-feature">
                                        <i class="fa fa-check pull-left" data-aos="zoom-in" data-aos-delay="100"></i>
                                        <div class="text">
                                            <h4>Multi procesors and ram memmories</h4>
                                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem omnis
                                                iste natus error sit volupt</p>
                                        </div>
                                    </div>
                                    <div class="host-feature">
                                        <i class="fa fa-check pull-left" data-aos="zoom-in" data-aos-delay="200"></i>
                                        <div class="text">
                                            <h4>Based on cloud computing and SSD Space</h4>
                                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem omnis
                                                iste natus error sit volupt</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="menu1" class="tab-pane">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/server.png" class="img-responsive animated fadeInLeft" alt="Wordpress Hosting">
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="text animated fadeInRight">
                                <div class="tab-title">
                                    <h3>World largest web hosting company</h3>
                                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatemSed ut
                                        perspiciatis unde omnis iste natus error sit voluptatem</p>
                                </div>
                                <div class="tab-lists">
                                    <div class="host-feature">
                                        <i class="fa fa-check pull-left" data-aos="zoom-in"></i>
                                        <div class="text">
                                            <h4>Fully Managed with unlimited Bandwidth</h4>
                                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>
                                        </div>
                                    </div>
                                    <div class="host-feature">
                                        <i class="fa fa-check pull-left" data-aos="zoom-in" data-aos-delay="100"></i>
                                        <div class="text">
                                            <h4>Multi procesors and ram memmories</h4>
                                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>
                                        </div>
                                    </div>
                                    <div class="host-feature">
                                        <i class="fa fa-check pull-left" data-aos="zoom-in" data-aos-delay="200"></i>
                                        <div class="text">
                                            <h4>Based on cloud computing and SSD Space</h4>
                                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="menu2" class="tab-pane">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/green-energy.png" class="img-responsive animated fadeInLeft"
                                alt="Wordpress Hosting">
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="text animated fadeInRight">
                                <div class="tab-title">
                                    <h3>World largest web hosting company</h3>
                                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatemSed ut
                                        perspiciatis unde omnis iste natus error sit voluptatem</p>
                                </div>
                                <div class="tab-lists">
                                    <div class="host-feature">
                                        <i class="fa fa-check pull-left" data-aos="zoom-in"></i>
                                        <div class="text">
                                            <h4>Fully Managed with unlimited Bandwidth</h4>
                                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>
                                        </div>
                                    </div>
                                    <div class="host-feature">
                                        <i class="fa fa-check pull-left" data-aos="zoom-in" data-aos-delay="100"></i>
                                        <div class="text">
                                            <h4>Multi procesors and ram memmories</h4>
                                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>
                                        </div>
                                    </div>
                                    <div class="host-feature">
                                        <i class="fa fa-check pull-left" data-aos="zoom-in" data-aos-delay="200"></i>
                                        <div class="text">
                                            <h4>Based on cloud computing and SSD Space</h4>
                                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="menu3" class="tab-pane">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/server.png" class="img-responsive animated fadeInLeft" alt="Wordpress Hosting">
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="text animated fadeInRight">
                                <div class="tab-title">
                                    <h3>World largest web hosting company</h3>
                                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatemSed ut
                                        perspiciatis unde omnis iste natus error sit voluptatem</p>
                                </div>
                                <div class="tab-lists">
                                    <div class="host-feature">
                                        <i class="fa fa-check pull-left" data-aos="zoom-in"></i>
                                        <div class="text">
                                            <h4>Fully Managed with unlimited Bandwidth</h4>
                                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>
                                        </div>
                                    </div>
                                    <div class="host-feature">
                                        <i class="fa fa-check pull-left" data-aos="zoom-in" data-aos-delay="100"></i>
                                        <div class="text">
                                            <h4>Multi procesors and ram memmories</h4>
                                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>
                                        </div>
                                    </div>
                                    <div class="host-feature">
                                        <i class="fa fa-check pull-left" data-aos="zoom-in" data-aos-delay="200"></i>
                                        <div class="text">
                                            <h4>Based on cloud computing and SSD Space</h4>
                                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Tab Switcher ends here-->

    <!-- Boxes style two -->
    <div class="boxes-two padding-bottom50 padding-top50">
        <div class="container">
            <div class="row">
                <div class="main-title text-center">
                    <h2>The most powerful website hosting</h2>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page
                        when looking at its layout. </p>
                </div>
                <div class="col-sm-4">
                    <div class="box-container">
                        <div class="box-title">
                            <h4><i class="fa fa-plus"></i> Wordpress Hosting</h4>
                        </div>
                        <ul>
                            <li>Fully Managed Servers</li>
                            <li>Unlimited Space and Bandwidth</li>
                            <li>Powerful and new servers</li>
                            <li>Based on SSD Space</li>
                            <li>Unlimited Free 24/7 Support</li>
                        </ul>
                        <div class="buttons">
                            <a href="#" class="btn btn-green btn-small">See offers <i class="fa fa-long-arrow-alt-right"></i></a>
                            <a href="#" class="btn btn-outline outline-dark btn-small">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="box-container">
                        <div class="box-title">
                            <h4><i class="fa fa-cloud"></i> Cloud Computing</h4>
                        </div>
                        <ul>
                            <li>Fully Managed Servers</li>
                            <li>Unlimited Space and Bandwidth</li>
                            <li>Powerful and new servers</li>
                            <li>Based on SSD Space</li>
                            <li>Unlimited Free 24/7 Support</li>
                        </ul>
                        <div class="buttons">
                            <a href="#" class="btn btn-green btn-small">See offers <i class="fa fa-long-arrow-alt-right"></i></a>
                            <a href="#" class="btn btn-outline outline-dark btn-small">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="box-container">
                        <div class="box-title">
                            <h4><i class="fa fa-server"></i> Dedicated Servers</h4>
                        </div>
                        <ul>
                            <li>Fully Managed Servers</li>
                            <li>Unlimited Space and Bandwidth</li>
                            <li>Powerful and new servers</li>
                            <li>Based on SSD Space</li>
                            <li>Unlimited Free 24/7 Support</li>
                        </ul>
                        <div class="buttons">
                            <a href="#" class="btn btn-green btn-small">See offers <i class="fa fa-long-arrow-alt-right"></i></a>
                            <a href="#" class="btn btn-outline outline-dark btn-small">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Boxes style two ends here -->

    <!-- Features five -->
    <div class="features-five padding-bottom50 padding-top50 ff-five2">
        <div class="custom-width">
            <div class="row">
                <div class="main-title title-white text-center">
                    <h2>Why you should starting using our services</h2>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page
                        when looking at its layout. </p>
                </div>
                <div class="column">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="text-content">
                            <i class="fab fa-aws pull-left" data-aos="zoom-in"></i>
                            <div class="text">
                                <h4>Optimized for Speed</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis nulla
                                    eum
                                    laudantium.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="text-content">
                            <i class="fa fa-bullhorn pull-left" data-aos="zoom-in" data-aos-delay="100"></i>
                            <div class="text">
                                <h4>Internet Marketing Included</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis nulla
                                    eum
                                    laudantium.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="text-content">
                            <i class="fa fa-server pull-left" data-aos="zoom-in" data-aos-delay="200"></i>
                            <div class="text">
                                <h4>Free Trial For One Month</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis nulla
                                    eum
                                    laudantium.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="column2">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="text-content">
                            <i class="fa fa-code pull-left" data-aos="zoom-in"></i>
                            <div class="text">
                                <h4>Full Root Access</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis nulla
                                    eum
                                    laudantium.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="text-content">
                            <i class="fab fa-wordpress pull-left" data-aos="zoom-in" data-aos-delay="100"></i>
                            <div class="text">
                                <h4>Powerful wordpress hosting</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis nulla
                                    eum
                                    laudantium.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="text-content">
                            <i class="fa fa-gem pull-left" data-aos="zoom-in" data-aos-delay="200"></i>
                            <div class="text">
                                <h4>Premium services and offers</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis nulla
                                    eum
                                    laudantium.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Features five ends here -->

   <!-- Features style 2 -->
    <div class="features-two padding-top50 padding-bottom50">
        <div class="custom-width">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                    <div class="box-shadow">
                        <div class="list-features">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="main-title text-left">
                                        <h2>Shared Hosting or Cloud Hosting</h2>
                                        <p>It is a long established fact that a reader will be distracted by the
                                            readable content of a page
                                            when looking at its layout. </p>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <h4>Shared Hosting Features</h4>
                                    <ul>
                                        <li><i class="fa fa-plus"></i> It is a long established fact that a reader</li>
                                        <li><i class="fa fa-plus"></i> Many desktop publishing packages web page</li>
                                        <li><i class="fa fa-plus"></i> Various versions have evolved over the</li>
                                        <li><i class="fa fa-plus"></i> It is a long established fact that a reader</li>
                                        <li><i class="fa fa-plus"></i> All the Lorem Ipsum generators on the
                                            Internet </li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <h4>Cloud Hosting Features</h4>
                                    <ul>
                                        <li><i class="fa fa-times"></i> Contrary to popular belief lorem Ipsum is
                                            not</li>
                                        <li><i class="fa fa-times"></i> All the Lorem Ipsum generators on the
                                            Internet </li>
                                        <li><i class="fa fa-times"></i> Many desktop publishing packages and error</li>
                                        <li><i class="fa fa-times"></i> Many desktop publishing packages web page</li>
                                        <li><i class="fa fa-times"></i> All the Lorem Ipsum generators on the
                                            Internet </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/other/4.jpg" class="img-responsive" alt="Wordpress Hosting">
                </div>
            </div>
        </div>
    </div>
    <!-- Features style 2 ends here -->

    <!-- Triple cols -->
    <div class="tripple-cols lighter-bg2 padding-bottom40">
        <div class="custom-width">
            <div class="row">
                <div class="col-sm-4" data-aos="fade-right">
                    <i class="fa fa-cloud pull-left"></i>
                    <div class="text">
                        <h4>Fully Managed Services</h4>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered alteration in some for have suffered.</p>
                    </div>
                </div>
                <div class="col-sm-4" data-aos="fade-right" data-aos-delay="100">
                    <i class="fa fa-hdd pull-left"></i>
                    <div class="text">
                        <h4>Based on SSD Space</h4>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered alteration in some for have suffered.</p>
                    </div>
                </div>
                <div class="col-sm-4" data-aos="fade-right" data-aos-delay="200">
                    <i class="fa fa-rocket pull-left"></i>
                    <div class="text">
                        <h4>Varnish Cache Enabled</h4>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered alteration in some for have suffered.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Triple cols ends here -->

    <!-- Colorful  Boxes -->
    <div class="colorful-boxes padding-bottom50 padding-top50">
        <div class="custom-width">
            <div class="row">
                <div class="main-title text-center">
                    <h2>With Bluerack offers you can't go wrong</h2>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page
                        when looking at its layout will be distracted. </p>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="box-container box1">
                        <i class="fa fa-microchip"></i>
                        <h4>Multi Core Xenon Processors</h4>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered alteration in some for have suffe</p>
                        <div class="buttons">
                            <a href="#" class="btn btn-outline btn-medium">Get more information</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="box-container box2">
                        <i class="fa fa-server"></i>
                        <h4>Managed Dedicated Servers</h4>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered alteration in some for have suffe</p>
                        <div class="buttons">
                            <a href="#" class="btn btn-outline btn-medium">Get more information</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="box-container box3">
                        <i class="fa fa-hdd"></i>
                        <h4>Unlimited Space and Bandwidth</h4>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered alteration in some for have suffe</p>
                        <div class="buttons">
                            <a href="#" class="btn btn-outline btn-medium">Get more information</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Colorful  Boxes -->

    <!-- Layout - Text right  -->
    <div class="layout-text right-layout padding-bottom50 padding-top50">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/laptop.png" class="img-responsive" alt="" data-aos="fade-right">
                    <img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/png-images/world2.png" class="img-absolute" alt="" data-aos="fade-right">
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="text-container" data-aos="fade-up">
                        <h3>Fully Managed and Powerful Website Hosting</h3>
                        <div class="text-content">
                            <i class="far fa-check-circle pull-left"></i>
                            <div class="text">
                                <p>It is a long established fact that a reader will be distracted by the readable
                                    content of a page when t is a long established fact that a reader will be
                                    distracted long fact that.</p>
                            </div>
                        </div>
                        <div class="text-content">
                            <i class="far fa-check-circle pull-left"></i>
                            <div class="text">
                                <p>It is a long established fact that a reader will be distracted by the readable
                                    content of a page when t is a long established when t is a long established.</p>
                            </div>
                        </div>
                        <div class="buttons">
                            <a href="#" class="btn btn-medium btn-green">Get More Information <i class="fas fa-long-arrow-alt-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Layout - Text right ends here  -->


    <!-- Features in lists -->
    <div class="list-features2 padding-bottom30 padding-top50">
        <div class="custom-width">
            <div class="row">
                <div class="main-title title-white text-center">
                    <h2>Reason to start using dedicated servers</h2>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page
                        when looking at its layout. </p>
                </div>
                <div class="col-sm-4">
                    <div class="left-lists">
                        <ul>
                            <li>Fully managed and nulinimted bandwidth</li>
                            <li>Based on SSD space and latest intel cpu</li>
                            <li>24/7 free online premium support and phone support</li>
                            <li>Free lifetime domain for all dedicated server plans</li>
                            <li>Fully managed and nulinimted bandwidth</li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="left-lists">
                        <ul>
                            <li>Fully managed and nulinimted bandwidth</li>
                            <li>Based on SSD space and latest intel cpu</li>
                            <li>24/7 free online premium support and phone support</li>
                            <li>Free lifetime domain for all dedicated server plans</li>
                            <li>Fully managed and nulinimted bandwidth</li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="left-lists">
                        <ul>
                            <li>Fully managed and nulinimted bandwidth</li>
                            <li>Based on SSD space and latest intel cpu</li>
                            <li>24/7 free online premium support and phone support</li>
                            <li>Free lifetime domain for all dedicated server plans</li>
                            <li>Fully managed and nulinimted bandwidth</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Features in lists ends here -->

    <!-- Boxes style one -->
    <div class="boxes-one padding-top50 padding-bottom50">
        <div class="custom-width">
            <div class="main-title text-center">
                <h2>Everything you need to Start a Website</h2>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page
                    when looking at its layout will be distracted. </p>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="box">
                        <img data-aos="zoom-in" src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/icons/6.png" class="img-responsive img-center" alt="Hosting">
                        <h4>24/7 Livechat Supprt</h4>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered
                            alteration in some form</p>
                        <a href="#" class="btn btn-outline outline-dark btn-small"> Get the deal </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="box">
                        <img data-aos="zoom-in" data-aos-delay="100" src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/icons/7.png" class="img-responsive img-center"
                            alt="Hosting">
                        <h4>Send Unlimited Tickets</h4>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered
                            alteration in some form</p>
                        <a href="#" class="btn btn-outline outline-dark btn-small"> Get the deal </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="box">
                        <img data-aos="zoom-in" data-aos-delay="200" src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/icons/8.png" class="img-responsive img-center"
                            alt="Hosting">
                        <h4>Free Website Transfer</h4>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered
                            alteration in some form</p>
                        <a href="#" class="btn btn-outline outline-dark btn-small"> Get the deal </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="box">
                        <img data-aos="zoom-in" data-aos-delay="300" src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/icons/4.png" class="img-responsive img-center"
                            alt="Hosting">
                        <h4>Fully Managed Servers</h4>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered
                            alteration in some form</p>
                        <a href="#" class="btn btn-outline outline-dark btn-small"> Get the deal </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Boxes style one ends here-->

    <!-- Testimonials slider -->
    <section class="testimonials white-bg" id="carousel">
        <div class="custom-width">
            <div class="row">
                <div class="col-md-12">
                    <div class="carousel slide" id="fade-quote-carousel" data-ride="carousel" data-interval="4000">
                        <ol class="carousel-indicators">
                            <li data-target="#fade-quote-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#fade-quote-carousel" data-slide-to="1"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="col-sm-4">
                                    <div class="text-left">
                                        <h2>What our clients are saying?</h2>
                                        <p>It is a long established fact that a reader will be distracted by the
                                            readable content of a page
                                            when looking at its layout. </p>
                                        <div class="buttons">
                                            <a href="#" class="btn btn-small btn-outline outline-dark">Check out all
                                                reviews <i class="fas fa-long-arrow-alt-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="profile-circle"><img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/other/testimonial1.jpg" class="img-responsive"
                                            alt="">
                                    </div>
                                    <blockquote>
                                        <p><i class="fa quote fa-quote-right fa-sm pull-left"></i>
                                            <br>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis
                                            nulla eum laudantium totam tempore optio doloremque laboriosam quas, quos
                                            eaque
                                            molestias.<i class="fa quote fa-quote-right fa-sm "></i></p>
                                        <small>www.domainname.com</small>
                                    </blockquote>
                                </div>
                                <div class="col-sm-4">
                                    <div class="profile-circle"><img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/other/testimonial2.jpg" class="img-responsive"
                                            alt="">
                                    </div>
                                    <blockquote>
                                        <p><i class="fa quote fa-quote-right fa-sm pull-left"></i>
                                            <br>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis
                                            nulla eum laudantium totam tempore optio doloremque laboriosam quas, quos
                                            eaque
                                            molestias.<i class="fa quote fa-quote-right fa-sm "></i></p>
                                        <small>www.domainname.com</small>
                                    </blockquote>
                                </div>
                            </div>
                            <div class="item">
                                <div class="col-sm-4">
                                    <div class="text-left">
                                        <h2>What our clients are saying?</h2>
                                        <p>It is a long established fact that a reader will be distracted by the
                                            readable content of a page
                                            when looking at its layout. </p>
                                        <div class="buttons">
                                            <a href="#" class="btn btn-small btn-outline outline-dark">Check out all
                                                reviews <i class="fas fa-long-arrow-alt-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="profile-circle"><img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/other/testimonial1.jpg" class="img-responsive"
                                            alt="">
                                    </div>
                                    <blockquote>
                                        <p><i class="fa quote fa-quote-right fa-sm pull-left"></i>
                                            <br>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis
                                            nulla eum laudantium totam tempore optio doloremque laboriosam quas, quos
                                            eaque
                                            molestias.<i class="fa quote fa-quote-right fa-sm "></i></p>
                                        <small>www.domainname.com</small>
                                    </blockquote>
                                </div>
                                <div class="col-sm-4">
                                    <div class="profile-circle"><img src="{$WEB_ROOT}/templates/{$template}/bluerack-files/images/other/testimonial2.jpg" class="img-responsive"
                                            alt="">
                                    </div>
                                    <blockquote>
                                        <p><i class="fa quote fa-quote-right fa-sm pull-left"></i>
                                            <br>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis
                                            nulla eum laudantium totam tempore optio doloremque laboriosam quas, quos
                                            eaque
                                            molestias.<i class="fa quote fa-quote-right fa-sm "></i></p>
                                        <small>www.domainname.com</small>
                                    </blockquote>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--  Testimonials slider ends here -->
{/if}

{include file="$template/includes/verifyemail.tpl"}
<section id="main-body">
    <div class="container{if $skipMainBodyContainer}-fluid without-padding{/if}">
        <div class="row">
        {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
            {if $primarySidebar->hasChildren() && !$skipMainBodyContainer}
                <div class="col-md-9 pull-md-right">
                    {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
                </div>
            {/if}
            <div class="col-md-3 pull-md-left sidebar">
                {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
            </div>
        {/if}
        <!-- Container for main page display content -->
        <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-md-9 pull-md-right{else}col-xs-12{/if} main-content">
            {if !$primarySidebar->hasChildren() && !$showingLoginPage && !$inShoppingCart && $templatefile != 'homepage' && !$skipMainBodyContainer}
                {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
            {/if}
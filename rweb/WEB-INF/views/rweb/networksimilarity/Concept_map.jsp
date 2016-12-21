<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Concept_map.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- Stylesheet -->	
	<link rel="stylesheet" href="rweb/js/Concept map_files/style.css" type="text/css">
	
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="http://www.findtheconversation.com/xmlrpc.php">
	
	<!-- WP Head -->
	<meta name="generator" content="WordPress 3.5.2">
<meta name="template" content="Oxygen 0.2.2">
<link rel="alternate" type="application/rss+xml" title="The Conversation » Feed" href="http://www.findtheconversation.com/feed/">
<link rel="alternate" type="application/rss+xml" title="The Conversation » Comments Feed" href="http://www.findtheconversation.com/comments/feed/">

			<style>               .fluid-width-video-wrapper {                 width: 100%;                              position: relative;                       padding: 0;                            }                                                                                   .fluid-width-video-wrapper iframe,        .fluid-width-video-wrapper object,        .fluid-width-video-wrapper embed {           position: absolute;                       top: 0;                                   left: 0;                                  width: 100%;                              height: 100%;                          }                                       </style><script type="text/javascript" async="" src="rweb/js/Concept map_files/ga.js"></script>
			<script type="text/javascript">//<![CDATA[
			// Google Analytics for WordPress by Yoast v4.2.8 | http://yoast.com/wordpress/google-analytics/
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-32153845-1']);
							_gaq.push(['_trackPageview']);
			(function () {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			})();
			var DATA = '<%=request.getParameter("filename") %>';
			//]]>
			</script>
			<link rel="alternate" type="application/rss+xml" title="The Conversation » Concept map Comments Feed" href="http://www.findtheconversation.com/concept-map/feed/">
			<link rel="stylesheet" id="collapseomatic-css-css" href="rweb/js/Concept map_files/style(1).css" type="text/css" media="all">
			<link rel="stylesheet" id="fancybox-stylesheet-css" href="rweb/js/Concept map_files/jquery.fancybox-1.3.4.css" type="text/css" media="screen">
			<link rel="stylesheet" id="font-abel-css" href="rweb/js/Concept map_files/css" type="text/css" media="screen">
			<link rel="stylesheet" id="font-oswald-css" href="rweb/js/Concept map_files/css(1)" type="text/css" media="screen">
			<link rel="stylesheet" id="font-terminal-dosis-css" href="rweb/js/Concept map_files/css(2)" type="text/css" media="screen">
			<link rel="stylesheet" id="font-droid-serif-css" href="rweb/js/Concept map_files/css(3)" type="text/css" media="screen">
			<link rel="stylesheet" id="wp-advanced-rp-css-css" href="rweb/js/Concept map_files/advanced-recent-posts-widget.css" type="text/css" media="all">
			<link rel="stylesheet" id="mediaelementjs-styles-css" href="rweb/js/Concept map_files/mediaelementplayer.css" type="text/css" media="all">
			<script type="text/javascript" src="rweb/js/Concept map_files/jquery.js"></script>
			<script type="text/javascript" src="rweb/js/Concept map_files/collapse.min.js"></script>
			<script type="text/javascript" src="rweb/js/Concept map_files/comment-reply.min.js"></script>
			<script type="text/javascript" src="rweb/js/Concept map_files/mediaelement-and-player.min.js"></script>
			<link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://www.findtheconversation.com/xmlrpc.php?rsd">
			<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://www.findtheconversation.com/wp-includes/wlwmanifest.xml"> 
			<link rel="prev" title="Registration" href="http://www.findtheconversation.com/registration/">
			<link rel="next" title="Locations" href="http://www.findtheconversation.com/locations/">

<!-- Style settings -->
<style type="text/css" media="all">
html { font-size: 16px; }
h1, h2, h3, h4, h5, h6, dl dt, blockquote, blockquote blockquote blockquote, #site-title, #menu-primary li a { font-family: Abel, sans-serif; }
a, a:visited, .page-template-front .hfeed-more .hentry .entry-title a:hover, .entry-title a, .entry-title a:visited { color: #0da4d3; }
a:hover, .comment-meta a, .comment-meta a:visited, .page-template-front .hentry .entry-title a:hover, .archive .hentry .entry-title a:hover, .search .hentry .entry-title a:hover { border-color: #0da4d3; }
.read-more, .read-more:visited, .pagination a:hover, .comment-navigation a:hover, #respond #submit, .button, a.button, #subscribe #subbutton, .wpcf7-submit, #loginform .button-primary { background-color: #0da4d3; }
a:hover, a:focus { color: #000; }
.read-more:hover, #respond #submit:hover, .button:hover, a.button:hover, #subscribe #subbutton:hover, .wpcf7-submit:hover, #loginform .button-primary:hover { background-color: #111; }
.ex-tooltip {
    position: absolute;
    background: #EEE;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    -ms-border-radius: 3px;
    -o-border-radius: 3px;
    border-radius: 3px;
    padding: 5px;
    -webkit-box-shadow: 0 1px 3px #000;
    -moz-box-shadow: 0 1px 3px #000;
    -ms-box-shadow: 0 1px 3px #000;
    -o-box-shadow: 0 1px 3px #000;
    box-shadow: 0 1px 3px #000;
    border-collapse: separate;
    display: none;
}
</style>

</head>
  
 <body class="wordpress ltr en_US child-theme y2015 m08 d27 h18 thursday logged-out singular singular-page singular-page-872 page-template-concepts">

	
	<div id="container">
		
		<div class="wrap">

				
			<div id="main">
	
				
<div id="graph"></div>
<div class="ex-tooltip" style="top: 1009px; left: 705.666625976563px; display: none;">Saturday: 9</div>
<script src="rweb/js/Concept map_files/d3.v3.min.js"></script>
<script src="rweb/js/Concept map_files/conversation.min.js"></script>

				
				
				</div><!-- .content-wrap -->

				
		</div><!-- #main -->

		
		
		
				
		</div><!-- .wrap -->

	<!-- #container -->

		
	<script type="text/javascript" src="rweb/js/Concept map_files/jquery.imagesloaded.js"></script>
<script type="text/javascript" src="rweb/js/Concept map_files/jquery.masonry.min.js"></script>
<script type="text/javascript" src="rweb/js/Concept map_files/jquery.cycle.min.js"></script>
<script type="text/javascript" src="rweb/js/Concept map_files/jquery.fitvids.js"></script>
<script type="text/javascript" src="rweb/js/Concept map_files/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript">
/* <![CDATA[ */
var slider_settings = {"timeout":"6000"};
/* ]]> */
</script>
<script type="text/javascript" src="rweb/js/Concept map_files/footer-scripts.js"></script>
<script type="text/javascript" src="rweb/js/Concept map_files/drop-downs.js"></script>

</html>

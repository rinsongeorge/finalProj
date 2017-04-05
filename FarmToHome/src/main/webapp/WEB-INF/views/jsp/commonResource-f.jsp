<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value='/resources/static/css/bootstrap.css' />" rel='stylesheet' type='text/css' />

<script src="<c:url value='/resources/static/js/jquery.min.js' />"></script>

<link href="<c:url value='/resources/static/css/style.css' />" rel='stylesheet' type='text/css' />

<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="application/x-javascript"> 

	addEventListener("load", function() { 
		setTimeout(hideURLbar, 0); 
	}, false); 
	function hideURLbar(){ 
		window.scrollTo(0,1); 
	} 

</script>

<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script src="<c:url value='/resources/static/js/jquery.easydropdown.js' />"></script>

<!-- Add fancyBox main JS and CSS files -->

<script src="<c:url value='/resources/static/js/jquery.magnific-popup.js'/>" type="text/javascript"></script>
<link href="<c:url value='/resources/static/css/magnific-popup.css'/>" rel="stylesheet" type="text/css">

		<script>
			$(document).ready(function() {
				$('.popup-with-zoom-anim').magnificPopup({
					type: 'inline',
					fixedContentPos: false,
					fixedBgPos: true,
					overflowY: 'auto',
					closeBtnInside: true,
					preloader: false,
					midClick: true,
					removalDelay: 300,
					mainClass: 'my-mfp-zoom-in'
			});
		});
		</script>

<script src="<c:url value='/resources/static/js/underscore.js'/>"></script>

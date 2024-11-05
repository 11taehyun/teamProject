<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/mainPage.css">
<link rel="stylesheet" href="/css/mainPage_footer.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header/header.jsp"/>	
<!-- <div id="myCarousel" class="carousel slide">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="./img1.jpg" alt="Image 1">
        </div>
          
        <div class="carousel-item">
            <img src="./img6.jpg" alt="Image 2">
        </div>
          
        <div class="carousel-item">
            <img src="./img3.jpg" alt="Image 3">
        </div>
    </div>
    <div id="dot">
        <ul>
          <li class="on"><a href="#"></a></li>
          <li><a href="#"></a></li>
          <li><a href="#"></a></li>
          <li><a href="#"></a></li>
          <li><a href="#"></a></li>
        </ul>
      </div>
    <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
    </a>
    <a class="carousel-control-next" href="#myCarousel" data-slide="next">
    </a>
   -->
	<div id="view">
	    <ul class="slide">
	      <li><img src="/image/mainPage/img1.jpg" alt="img1"></li>
	      <li><img src="/image/mainPage/img2.jpg" alt="img2"></li>
	      <li><img src="/image/mainPage/img3.jpg" alt="img3"></li>
	      <li><img src="/image/mainPage/img4.jpg" alt="img4"></li>
	      <li><img src="/image/mainPage/img5.jpg" alt="img5"></li>
	
	    </ul>
	
	    <button class="prev"><i class="fa-solid fa-chevron-left"></i></button>
	    <button class="next"><i class="fa-solid fa-chevron-right"></i></button>        
	</div>

	<div id="dot">
	  <ul>
	    <li class="on"><a href="#"></a></li>
	    <li><a href="#"></a></li>
	    <li><a href="#"></a></li>
	    <li><a href="#"></a></li>
	    <li><a href="#"></a></li>
	  </ul>
	</div>
   
  	<h1 style="top:3em">사이트 별 1위상품</h1>

	 <div>
		<div id="brand">
		    <div>
		        <a href=""><img src="/image/mainPage/blackmusinsa.png" alt="" class="brand_logo" ></a>
		        <span></span>
		        <a href=""><img src="/image/mainPage/musinsa.jpg" alt="" class="item"></a>
		        <a href=""><img src="/image/mainPage/heart_icon.png" alt="" id="heart"></a>
		    </div>
		    <div>
		        <a href=""><img src="/image/mainPage/mustitlogo.png" alt="" class="brand_logo"></a>
		        <span></span>
		        <a href=""><img src="/image/mainPage/mustit.jpg" alt="" class="item"></a>
		        <a href=""><img src="/image/mainPage/heart_icon.png" alt="" id="heart"></a>
		    </div>
		    <div>
		        <a href=""><img src="/image/mainPage/29cmlogo.png" alt="" class="brand_logo"></a>
		        <span></span>
		        <a href=""><img src="/image/mainPage/29cm.jpg" alt="" class="item"></a>
		        <a href=""><img src="/image/mainPage/heart_icon.png" alt=""id="heart"></a>
		    </div>
		</div>
	 </div>
	<!-- footer -->
	<jsp:include page="../footer/footer.jsp"/>
</body>

<script>
    /*-----------------------------------------------------------------------------------------*/


    $(function() {
	    $('#mid2').hide();
	
	    $('#header').hover(function() {
	        $(this).parent().find('#menu2').slideDown(300);
	    }, function() {
	        var header = $(this);
	        var menu2 = header.parent().find('#menu2');
	        var mid2 = header.parent().find('#mid2');
	        setTimeout(function() {
	            if (!menu2.is(':hover') && !mid2.is(':hover')) {
	                mid2.slideUp(300);
	            } else if (!mid2.is(':hover')) {
	                mid2.slideUp(300);
	            }
	        }, 300);
	    });
	
	    $('#menu2').hover(function() {
	        $(this).parent().find('#mid2').slideDown(300);
	    }, function() {
	        var header = $(this).closest('#header');
	        var mid2 = header.find('#mid2');
	        setTimeout(function() {
	            if (!mid2.is(':hover')) {
	                mid2.slideUp(300);
	            }
	        }, 300);
	    });
	
	    var lastScrollTop = 0;
	    $(window).scroll(function() {
	        var scroll = $(window).scrollTop();
	        var menu2 = $('#menu2');
	        var mid2 = $('#mid2');
	
	        if (scroll > lastScrollTop) { 
	            if (!menu2.is(':hover') && !mid2.is(':hover')) {
	                mid2.slideUp(300, function() {
	                    menu2.slideUp(300);
	                });
	            } else if (!mid2.is(':hover')) {
	                mid2.slideUp(300);
	            }
	        } else {  
	            menu2.slideDown(300);
	        }
	
	        lastScrollTop = scroll;
	    });
	});
	
	
	    const bestMenu2 = document.querySelector(".best_menu2");
	    const bestSubMenu2 = document.querySelector("#best2");
	
	    bestSubMenu2.addEventListener("mouseover", function() {
	     bestMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    bestSubMenu2.addEventListener("mouseout", function() {
	    bestMenu2.style.borderBottom = "none";
	    });
	
	    bestMenu2.addEventListener("mouseover", function() {
	    bestMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	    bestMenu2.addEventListener("mouseout", function() {
	    bestMenu2.style.borderBottom = "none";
	    });
	
	    const womenMenu2 = document.querySelector(".women_menu2");
	    const womenSubMenu2 = document.querySelector("#women2");
	
	    womenSubMenu2.addEventListener("mouseover", function() {
	    womenMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    womenSubMenu2.addEventListener("mouseout", function() {
	    womenMenu2.style.borderBottom = "none";
	    });
	
	    womenMenu2.addEventListener("mouseover", function() {
	    womenMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    womenMenu2.addEventListener("mouseout", function() {
	    womenMenu2.style.borderBottom = "none";
	    });
	
	    const menMenu2 = document.querySelector(".men_menu2");
	    const menSubMenu2 = document.querySelector("#men2");
	
	    menSubMenu2.addEventListener("mouseover", function() {
	    menMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    menSubMenu2.addEventListener("mouseout", function() {
	    menMenu2.style.borderBottom = "none";
	    });
	
	    menMenu2.addEventListener("mouseover", function() {
	    menMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    menMenu2.addEventListener("mouseout", function() {
	    menMenu2.style.borderBottom = "none";
	    });
	
	    const kidsMenu2 = document.querySelector(".kids_menu2");
	    const kidsubMenu2 = document.querySelector("#kids2");
	
	    kidsubMenu2.addEventListener("mouseover", function() {
	    kidsMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    kidsubMenu2.addEventListener("mouseout", function() {
	    kidsMenu2.style.borderBottom = "none";
	    });
	
	    kidsMenu2.addEventListener("mouseover", function() {
	    kidsMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    kidsMenu2.addEventListener("mouseout", function() {
	    kidsMenu2.style.borderBottom = "none";
	    });
	
	    const beautyMenu2 = document.querySelector(".beauty_menu2");
	    const beautyubMenu2 = document.querySelector("#beauty2");
	
	    beautyubMenu2.addEventListener("mouseover", function() {
	    beautyMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    beautyubMenu2.addEventListener("mouseout", function() {
	    beautyMenu2.style.borderBottom = "none";
	    });
	
	    beautyMenu2.addEventListener("mouseover", function() {
	    beautyMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    beautyMenu2.addEventListener("mouseout", function() {
	    beautyMenu2.style.borderBottom = "none";
	    });
	
	    $(window).scroll(function(){
	    if($(document).scrollTop() > 0) {
	        $('header').addClass('scrolled');
	    } else {
	        $('header').removeClass('scrolled');
	    }
	    });
	
	    $(window).scroll(function(){
	    if($(document).scrollTop() > 0) {
	        $('#header').css('background-color', '#000'); 
	        $('#search2 img').attr('src', '/image/mainPage/search_regular_icon.png');
	        $('#logo2 img').attr('src', '/image/mainPage/logo2.png');
	        $('#search2 input[type="text"]').css('color', '#fff'); 
	        $('#search2 input[type="text"]').css('background-color', '#000'); 
	        $('#logout div a').css('color', '#fff'); 
	        $('#logout2 div a').css('none'); 
	        $('#login div a').css('color', '#fff'); 
	        $('#login2 div a').css('color', '#fff'); 
	        $('.person').attr('src', 'none');
	        $('.heart_icon').attr('src', 'none');
	        $('.cart').attr('src', 'none');
// 			$('#login_conteiner').css('display', 'block')
	    } else {
	        $('#header').css('background-color', '#fff'); 
	        $('#search2 img').attr('src', '/image/mainPage/search.png');
	        $('#logo2 img').attr('src', '/image/mainPage/logo.png');
	        $('#search2 input[type="text"]').css('color', 'black'); 
	        $('#search2 input[type="text"]').css('background-color', '#fff'); 
	        $('#logout div a').css('none');
	        $('#logout2 div a').css('color', 'black');
	        $('#login div a').css('none');
	        $('#login2 div a').css('color', 'black');
	        $('.person').attr('src', '/image/mainPage/person.png',);
	        $('.heart_icon').attr('src', '/image/mainPage/heart.png');
	        $('.cart').attr('src', '/image/mainPage/cart.png');
// 			$('#login_conteiner').css('display', 'none')
	    }
	     });
	
	//     $(document).ready(function(){
	//     $("#myCarousel").carousel();
	
	//     $("#myCarousel").on("slide.bs.carousel", function(e){
	//     var $e = $(e.relatedTarget);
	//     var idx = $e.index();
	//     var itemsPerSlide = 3;
	//     var totalItems = $(".carousel-item").length;
	    
	//     if (idx >= totalItems-(itemsPerSlide-1)) {
	//         var it = itemsPerSlide - (totalItems - idx);
	//         for (var i=0; i<it; i++) {
	//         if (e.direction=="left") {
	//             $(".carousel-item").eq(i).appendTo(".carousel-inner");
	//         }
	//         else {
	//             $(".carousel-item").eq(0).appendTo(".carousel-inner");
	//         }
	//         }
	//     }
	//     });
	//     });
	
	//     $(document).ready(function() {
	//   $("#myCarousel").carousel();
	
	//   $("#myCarousel").on("slide.bs.carousel", function(e) {
	//     var $e = $(e.relatedTarget);
	//     var idx = $e.index();
	//     var totalItems = $(".carousel-item").length;
	
	//     // Update the dot color
	//     $(".carousel-indicators li").removeClass("active");
	//     $(".carousel-indicators li[data-slide-to='" + idx + "']").addClass("active");
	//   });
	
	//   // Navigate to the corresponding image when the dot is clicked
	//   $(".carousel-indicators li").click(function() {
	//     var slideTo = $(this).attr("data-slide-to");
	//     $("#myCarousel").carousel(parseInt(slideTo));
	//   });
	// });
	
	// $(document).ready(function(){
	//           var $dot = $("#dot ul li");
	//           var slideIndex = 0;
	//           var len = $(".slide li").length;
	
	//           $(".prev").on("click", function(){
	//             slideIndex -= 1; 
	//             if( slideIndex < 0 ) { slideIndex = len - 1; }
	//             if( slideIndex >= len ) { slideIndex = 0 ;} 
	//             console.log(slideIndex);
	//             $(".slide").animate({marginLeft:-85 * slideIndex + "em" });
	//             $dot.css({background:"gray"});
	//             $dot.eq(slideIndex).css({background:"#C80808"});
	//           });
	
	//           $(".next").on("click", function(){
	//             slideIndex += 1; 
	//             if( slideIndex < 0 ) { slideIndex = len - 1; }
	//             if( slideIndex >= len ) { slideIndex = 0 ;} 
	//             $(".slide").animate({marginLeft:-85 * slideIndex + "em" });
	//              $dot.css({background:"gray"});
	//             $dot.eq(slideIndex).css({background:"#C80808"});
	//           });
	
	//         $dot.on("click",function(){
	//           $(".slide").animate({marginLeft:-85 * $(this).index() + "em"});
	//           $dot.css({"background":"gray"});
	//           $(this).css({"background":"#C80808"});
	//           slideIndex = $(this).index(); console.log(slideIndex);
	//         });
	
	//        });
	
	
	// $(document).ready(function(){
	//           var $dot = $("#dot ul li");
	//           var slideIndex = 0;
	//           var len = $(".slide li").length;
	
	//           $(".prev").on("click", function(){
	//             slideIndex -= 1; 
	//             if (slideIndex < 0) { slideIndex = len - 1; }
	//             $(".slide").animate({ marginLeft: -85 * slideIndex + "em" });
	
	//             $dot.css({ background: "gray" });
	//             $dot.eq(slideIndex).css({ background: "#C80808" });
	//             });
	
	
	//             $(".next").on("click", function(){
	//             slideIndex += 1; 
	//             if (slideIndex >= len) { 
	//                 slideIndex = 0;
	//                 $(".slide").css({ marginLeft: "0em" });
	//             }
	//             $(".slide").animate({ marginLeft: -85 * slideIndex + "em" });
	
	//             $dot.css({ background: "gray" });
	//             $dot.eq(slideIndex).css({ background: "#C80808" });
	//             });
	
	//             $dot.on("click", function(){
	//                 $(".slide").animate({ marginLeft: -85 * $(this).index() + "em" });
	//                 $dot.css({ background: "gray" });
	//                 $(this).css({ background: "#C80808" });
	//                 slideIndex = $(this).index();
	//             });
	
	//        });
	
	$(document).ready(function() {
	  var $dot = $("#dot ul li");
	  var slideIndex = 0;
	  var len = $(".slide li").length;
	  var interval;
	  var isPaused = false; // Variable to track pause state
	
	  function startSlideshow() {
	    interval = setInterval(function() {
	      if (!isPaused) {
	        slideIndex += 1;
	        if (slideIndex >= len) {
	          slideIndex = 0;
	        }
	        $(".slide").animate({ marginLeft: -85 * slideIndex + "em" });
	        $dot.css({ background: "gray" });
	        $dot.eq(slideIndex).css({ background: "#fff" });
	      }
	    }, 3000);
	
	    // Pause the slideshow when a dot is clicked
	    $dot.on("click", function() {
	      var clickedIndex = $(this).index();
	      isPaused = true;
	
	      $(".slide").animate({ marginLeft: -85 * clickedIndex + "em" });
	      $dot.css({ background: "rgba(153, 153, 153, 0.712)" });
	      $(this).css({ background: "#fff" });
	      slideIndex = clickedIndex;
	
	      setTimeout(function() {
	        isPaused = false;
	      }, 5000); // Resume automatic sliding after 5 seconds (adjustable duration)
	    });
	  }
	
	  startSlideshow();
	
	  $(".prev").on("click", function() {
	    clearInterval(interval);
	    isPaused = true;
	
	    slideIndex -= 1;
	    if (slideIndex < 0) {
	      slideIndex = len - 1;
	    }
	    $(".slide").animate({ marginLeft: -85 * slideIndex + "em" });
	    $dot.css({ background: "rgba(153, 153, 153, 0.712)" });
	    $dot.eq(slideIndex).css({ background: "#fff" });
	
	    setTimeout(function() {
	      isPaused = false;
	    }, 5000); // Resume automatic sliding after 5 seconds (adjustable duration)
	  });
	
	  $(".next").on("click", function() {
	    clearInterval(interval);
	    isPaused = true;
	
	    slideIndex += 1;
	    if (slideIndex >= len) {
	      slideIndex = 0;
	    }
	    $(".slide").animate({ marginLeft: -85 * slideIndex + "em" });
	    $dot.css({ background: "rgba(153, 153, 153, 0.712)" });
	    $dot.eq(slideIndex).css({ background: "#fff" });
	
	    setTimeout(function() {
	      isPaused = false;
	    }, 5000); // Resume automatic sliding after 5 seconds (adjustable duration)
	  });
	});

    
</script>
</html>
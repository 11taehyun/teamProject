/*-----------------------------------------------------------------------------------------*/
	    $(function() {
		    $('#menu2').hide();
		    $('#mid2').hide();
		
		    var menu2Timeout; // Declare a variable to store the timeout for menu2
		
		    $('#header').hover(function() {
		        var menu2 = $(this).parent().find('#menu2');
		        var mid2 = $(this).parent().find('#mid2');
		        clearTimeout(menu2Timeout); // Clear the timeout for menu2
		        menu2.slideDown(300);
		        mid2.hide();
		    }, function() {
		        var header = $(this);
		        var menu2 = header.parent().find('#menu2');
		        var mid2 = header.parent().find('#mid2');
		        menu2Timeout = setTimeout(function() {
		            if (!menu2.is(':hover') && !mid2.is(':hover')) {
		                mid2.slideUp(300);
		                menu2.slideUp(300);
		            } else if (!mid2.is(':hover')) {
		                mid2.slideUp(300);
		            }
		        }, 300);
		    });
		
		    $('#menu2').hover(function() {
		        clearTimeout(menu2Timeout); // Clear the timeout for menu2
		        $(this).parent().find('#mid2').slideDown(300);
		    }, function() {
		        var header = $(this).closest('#header');
		        var mid2 = header.find('#mid2');
		        var menu2 = header.find('#menu2');
		        menu2Timeout = setTimeout(function() {
		            if (!mid2.is(':hover')) {
		                mid2.slideUp(300);
		            }
		        }, 300);
		    });
		
		    $('#mid2').mouseenter(function() {
		        clearTimeout(menu2Timeout); // Clear the timeout for menu2
		    });
		
		    $('#mid2').mouseleave(function() {
		        var mid2 = $(this);
		        var menu2 = mid2.parent().find('#menu2');
		        mid2.slideUp(300);
		        menu2.slideUp(300);
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
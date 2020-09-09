$(document).ready(function() {
	"use strict";
	
// Animate the scroll to top
	$(window).scroll(function() {
        if ($(this).scrollTop() > 200) {
            $('.scroll-to-top').fadeIn(500);
        } else {
            $('.scroll-to-top').fadeOut(300);
        }
    });
    
    $('.scroll-to-top').click(function(event) {
        event.preventDefault();
		$('html, body').animate({scrollTop: 0}, 300);
    });

// Toast
    $('#Toast').toast({
		delay:5000
	});
	$('#Toast').toast('show');
	
	$('#LongToast').toast({
		delay:10000
	});
	$('#LongToast').toast('show');

// Custom Toast
	$('#Toast').toast({
		delay:5000
	});
	
	jQuery('.toast__close').click(function(e){
        e.preventDefault();
        var parent = $(this).parent('.custom__toast');
        parent.fadeOut("slow", function() { $(this).remove(); } );
      });
	
// Tool tip
	$('[data-toggle = "tooltip"]').tooltip();

// Default Checked In Use
	$('.inn').prop('checked',true);
	
// MenuBar

// SideBar
	$("#sidebar").mCustomScrollbar({
        theme: "minimal"
    });

    $('#dismiss, .overlay').on('click', function () {
        $('#sidebar').removeClass('active');
        $('.overlay').removeClass('active');
    });

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').addClass('active');
        $('.overlay').addClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });
});
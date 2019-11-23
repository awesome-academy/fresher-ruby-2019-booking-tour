
$(document).on("turbolinks:load", function(){
  
  $(".star_content .star").click(function(){
    star = $(this).find("i").attr("value");
    $("#rating_star").val(star);
    console.log(star);
    $(".star_content .star").removeClass("star_on");
    for (i=1; i<=parseInt(star)+1; i++)
    {
      $(".star_content .star:nth-child("+i+")").addClass("star_on");
    }
  });
  $('.average-review-rating').raty({
		readOnly: true,
		path: '/assets/',
		score: function() {
			return $(this).attr('data-score')
		}
  });
  
  $('#datetimepicker').datetimepicker({
    format: 'm/d/Y'
  });
  
  $('#booking_people_number').change(function(){
    caculator_price();
  });
  
  function caculator_price(){
    let people_number = parseInt($('#booking_people_number').val());
    let tour_price = parseInt($('#tour_price').val());
    if(people_number >= 1) {
      price = people_number * tour_price;
      $('#booking_price').val(price);
    }else {
      $('#booking_price').val(0);
    }
  }
  
  $('#book_tour').on('click', function(){
    $('.booking_fail').html('');
    $('.account_not_enough').html('');
    $('#new_booking')[0].reset();
  })
  $('#btn_review').on('click', function(){
    $('.review_error').html('');
    $('#new_review')[0].reset();
    $('#review_content').html('');
  });

});

$(document).on('scroll', function()
{
  header = $('.header');
  headerSocial = $('.header_social');

  if($(window).scrollTop() > 127)
  {
    header.addClass('scrolled');
    headerSocial.addClass('scrolled');
  }
  else
  {
    header.removeClass('scrolled');
    headerSocial.removeClass('scrolled');
  }
});
$(document).ready(function(){
  let showChar = 100;  // How many characters are shown by default
  let ellipsestext = "";
  let moretext = "Show less";
  let lesstext = " Show more";
  

  $('.more').each(function() {
    let content = $(this).html();
    
    if(content.length > showChar) {
      
      let c = content.substr(0, showChar);
      let h = content.substr(showChar, content.length - showChar);
      
      let html = c + '<span class="moreellipses">' + ellipsestext + '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
      
      $(this).html(html);
    }
    
  });
  
  $(".morelink").on('click', function(){

    if($(this).hasClass("less")) {
      $(this).removeClass("less");
      $(this).html(moretext);
    } else {
      $(this).addClass("less");
      $(this).html(lesstext);
    }
    $(this).parent().prev().toggle();
    $(this).prev().toggle();
    return false;
  })
});

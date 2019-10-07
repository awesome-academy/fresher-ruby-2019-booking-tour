
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
});

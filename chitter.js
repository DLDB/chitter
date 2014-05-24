$( document ).ready(function () {
  $('.statHead').hover( function() {
    $( this ).animate( {
      'color' : '#0084B4'
    }, 'slow');
  } )
  $('.chitBox').focus(function () {
    $( this ).css( "height", "93px" );
    $( this ).removeAttr('placeholder');
    $('.accountDetails').css( "height", "460px");
    $('.spoutSomeChit').css( "height", "auto");
    $('.chitForm').css("height", "380px");
    $('.chitButtons').css("margin-top", "10px");
    $(this).css("color","#000000")
  });
  $('.chitBox').blur(function () {
    if($(".chitBox").val().length < 1) {
      $(this).css( "height", "32px");
      $(this).attr("placeholder", "Compose new Cheet...");
      $('.spoutSomeChit').css( "height", "36px");
      $('.chitButtons').css("margin-top", "20px");
      $('.accountDetails').css( "height", "253px");
    }
    else {
      $(this).css("color","#8899B3")
    }
  });
  $( '.addPics' ).hover(function() {
    $(this).css('padding','4px');
    $(this).css('border','1px solid #00A6CC')
  }, function() {
    $(this).css('border','0');
    $(this).css('padding','5px');
  })
  $('.chitBox').bind('input propertychange',function() {
    var cheetText = $(this).val();
    var charactersLeft = 140 - cheetText.length;
    $('.chitCount').html(charactersLeft)
  });
  $('.cheetButton').hover(function() {
      $(this).css('background-color', '#0084B4');
    }, function() {
      $(this).css('background-color', '#73BBD6');
  })
});



var FindByEmail = {
  find: function() {
    var userEmail = {email: $('#email').val()};

    $.ajax({
      url: '/users/findmentor',
      type: 'POST',
      data: userEmail,
      dataType: "JSON"
    }).done(FindByEmail.populate);
  },
  populate: function(response) {
    if (response.no_user) {}
    else {
      console.log(response.bio)
      console.log(response.interests)
      $('#first_name').val(response.first_name);
      $('#last_name').val(response.last_name);
      $('#twitter_handle').val(response.twitter_handle);
      $('#bio').val(response.bio);
      $('#interests').val(response.interests)
    }
  }
}

var TabHelper = {
  toggle:function(){
    $('.tab').on("click", function(e){
      $('.tabs').children().removeClass('active')
      $(this).addClass('active')
      var clickedID = $(this).attr('id')
      TabHelper.showFields(clickedID)
    })
  },
  showFields:function(selector){
    if (selector === "basics"){
      $("#optional_fields").hide();
    }
    else if (selector === "more"){
      $("#optional_fields").show();
    }
  }
}

$(document).ready(function() {

  TabHelper.toggle()

  $('#email').on('blur', FindByEmail.find)

});

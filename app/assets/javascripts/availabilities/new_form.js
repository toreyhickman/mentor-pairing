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

$(document).ready(function(){
  TabHelper.toggle()
})

$(function() {
  $("form").on("submit", function(event) {
    event.preventDefault();

    $.ajax($(this).attr("action"), {
      type: $(this).attr("method"),
      data: $(this).serialize(),
      dataType: "json",

      success: function(resp) {
        $("#preview").html("").append("<style>" + resp.css + "</style>").append(resp.html).parents(".row").show()
        $("#html").val(resp.html).parents(".row").show();

        if(resp.css) {
          $("#css").val(resp.css).parents(".row").show();
        }
        else {
          $("#css").parents(".row").hide()
        }
      },

      failure: function() {
        alert("dunno dude, maybe try again?");
      }
    });
  });
});


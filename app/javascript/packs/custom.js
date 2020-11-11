const UIkit = require('uikit');

$(document).on("ready", function () {
  $("tr.ajaxShow[data-link]").on("click", function (e) {
    e.preventDefault();
    
    $.ajax({
        url: this.getAttribute('data-link'),
        dataType: "script",
        type: "GET",
        success: function (response, status, xhr) {
          $("#modal-content").html(xhr.response);
          UIkit.modal("#modal").show();

          return false;
        },
        error: function (data) { }
    });
    
  });

  $(".ajaxNew[data-link]").on("click", function (e) {
    $("#loading").show();
    UIkit.offcanvas("#edition-canvas-container").hide();
    $.ajax({
      url: this.getAttribute('data-link'),
      dataType: "script",
      type: "GET",
      success: function (response, status, xhr) {
        $("#modal-content").html(xhr.response);
        UIkit.modal("#modal").show();
        $("#loading").hide();
        UIkit.offcanvas("#edition-canvas-container").show();
        return false;
      },
      error: function (data) { $("#loading").hide(); }
    });
  });

});


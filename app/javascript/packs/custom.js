import $ from 'jquery'

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
      UIkit.offcanvas("#edition-canvas-container").show();
      $("#loading").hide();
      return false;
    },
    error: function (data) { $("#loading").hide(); }
  });
});

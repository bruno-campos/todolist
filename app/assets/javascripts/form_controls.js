var FormControls = {
  showMessage: function(el, message, type) {
    var class_type = (!!type) ? "alert-" + type  : "";
    $(el).prepend("<div class='alert " + class_type + "'>"  + message + "</div>");
  },
  addErrors: function(el, error_list) {
    for(key in error_list) {
      $(el).find(".controls-" + key).addClass("has-error");
      $(el).find(".controls-" + key).append("<span class='help-block'>" + error_list[key] + "</span>");
    }
  },
  clearErrors: function(el) {
    $(".form-group", el).removeClass("has-error");
    $(".help-block", el).remove();
    $(".alert", el).remove();
  }
};
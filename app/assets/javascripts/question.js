var Answerable = {
  init: function(){
    $('.reply_link').on('ajax:success', this.renderForm);
  },

  renderForm: function(event, data) {
    console.log("Returned From aJAx")
    $(this).after(data)
  }
};

$(document).ready(function(){
  Answerable.init();
});

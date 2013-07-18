var Answerable = {
  init: function(){
    $('#question').on('ajax:success', '.reply_link', this.renderForm);
    $('#question').on('ajax:success', 'form', this.renderAnswer);
  },

  renderForm: function(event, data) {
    $(this).after(data);
  },

  renderAnswer: function(event,data) {
    $(this).closest('.answer').append(data);
    $('.foo').remove();
  }
};

$(document).ready(function(){
  Answerable.init();
});

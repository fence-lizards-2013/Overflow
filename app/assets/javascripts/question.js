// REVIEW: objects FTW (that's the first time I ever used FTW, big deal)
// nice clean code.
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

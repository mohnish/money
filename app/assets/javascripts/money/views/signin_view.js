M.SigninView = M.BaseView.extend({
  el: '#signin-form',

  model: new M.User(),

  templatePath: 'welcome/signin',

  initialize: function() {
  },

  render: function() {
    this.setPageTitle('Signin');
    $('#money').html(this.template());
    return this;
  },

  events: {
    'submit': 'handleSubmit'
  },

  handleSubmit: function(e) {
    e.preventDefault();
  }
});

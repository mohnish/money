M.SigninView = M.BaseView.extend({
  className: 'signin',

  model: new M.Authentication(),

  templatePath: 'welcome/signin',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.handleSync);
    this.listenTo(this.model, 'invalid', this.handleInvalid);
    this.listenTo(this.model, 'error', this.handleError);
  },

  render: function() {
    this.setPageTitle('signin');
    $('#money').html(this.$el.html(this.template()));
    return this;
  },

  events: {
    'submit': 'handleSubmit',
    'click .show-signup': 'showSignup',
    'click .show-signin': 'showSignin'
  },

  // overriding base view's format errors
  formatErrors: function() {
    return ['invalid username/password combination.'];
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var props = this.createAttributesObject(this.$('#signin-form').serializeArray());
    this.model.destroyExistingToken();
    this.model.set(props);

    if (this.model.isValid({ checkPassword: true })) {
      this.model.save();
      this.setValidationResponse('waiting...');
    }
  },

  handleSync: function(model, response, options) {
    this.model.persistTokenLocally();
    this.model.removePassword();
    M.dispatcher.trigger('m:signin:success');
  }
});

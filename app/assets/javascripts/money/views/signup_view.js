M.SignupView = M.BaseView.extend({
  className: 'signup',

  model: new M.User(),

  templatePath: 'welcome/signup',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.handleSync);
    this.listenTo(this.model, 'invalid', this.handleInvalid);
    this.listenTo(this.model, 'error', this.handleError);
  },

  render: function() {
    this.setPageTitle('signup');
    $('#money').html(this.$el.html(this.template()));
    return this;
  },

  events: {
    'submit': 'handleSubmit'
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var props = this.createAttributesObject(this.$('#signup-form').serializeArray());
    this.model.destroyExistingToken();
    this.model.set(props);

    if (this.model.isValid({ checkPassword: true })) {
      this.model.save();
      // TODO: Replace this with a loader gif
      this.setValidationResponse('waiting...');
    } else {
      this.setValidationResponse(this.model.validationError);
    }
  },

  handleSync: function(model, response, options) {
    M.dispatcher.trigger('m:signup:success');
  }
});

M.SignupView = M.BaseView.extend({
  el: '#money',

  model: new M.User(),

  templatePath: 'welcome/signup',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.handleSync);
    this.listenTo(this.model, 'invalid', this.handleInvalid);
    this.listenTo(this.model, 'error', this.handleError);
  },

  render: function() {
    this.setPageTitle('Signup');
    this.$el.html(this.template());
    return this;
  },

  events: {
    'submit': 'handleSubmit'
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var props = this.createAttributesObject(this.$('#signup-form').serializeArray());
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
    this.setValidationResponse('profile successfully created', 'success');
  }
});

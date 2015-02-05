M.SigninView = M.BaseView.extend({
  el: '#money',

  model: new M.Authentication(),

  templatePath: 'welcome/signin',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.handleSync);
    this.listenTo(this.model, 'invalid', this.handleInvalid);
    this.listenTo(this.model, 'error', this.handleError);
  },

  render: function() {
    this.setPageTitle('Signin');
    this.$el.html(this.template());
    return this;
  },

  events: {
    'submit': 'handleSubmit'
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var props = this.createAttributesObject(this.$('#signin-form').serializeArray());
    this.model.set(props);

    if (this.model.isValid()) {
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

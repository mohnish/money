M.SignupView = M.BaseView.extend({
  el: '#signup-form',

  model: new M.User(),

  initialize: function() {
    this.listenTo(this.model, 'sync', this.handleSync);
    this.listenTo(this.model, 'invalid', this.handleError);
    this.listenTo(this.model, 'error', this.handleError);
  },

  events: {
    'submit': 'handleSubmit'
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var props = this.createAttributesObject(this.$el.serializeArray());
    this.model.set(props)

    if (this.model.isValid({ checkPassword: true })) {
      this.model.save();
      // TODO: Replace this with a loader gif
      this.setValidationResponse('waiting...');
    } else {
      this.setValidationResponse(this.model.validationError);
    }
  },

  setValidationResponse: function(text) {
    this.$('.validation-response').text(text);
  },

  handleSync: function(model, response, options) {
    this.setValidationResponse('profile successfully created');
  },

  handleError: function(model, response, options) {
    var errors = this.formatErrors(response);
    this.setValidationResponse(errors.join('\n'));
  }
});

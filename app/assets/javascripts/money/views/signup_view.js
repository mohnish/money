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
      this.setValidationResponse('waiting...');
    } else {
      this.setValidationResponse(this.model.validationError);
    }
  },

  setValidationResponse: function(text) {
    this.$('.validation-response').text(text);
  },

  handleSuccess: function(model, response, options) {

  },

  handleSync: function(model, response, options) {

  },

  handleError: function(model, response, options) {

  }
});

M.SignupView = Backbone.View.extend({
  el: '#signup-form',

  model: new M.User(),

  initialize: function() {
    this.listenTo(this.model, 'sync', this.handleSuccess);
    this.listenTo(this.model, 'invalid', this.handleFail);
  },

  events: {
    'submit': 'handleSubmit'
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var props = this.serializeForm(this.$el.serializeArray());
    this.model.set(props)

    if (this.model.isValid({ checkPassword: true })) {
      this.model.save();
      this.setValidationResponse('waiting...');
    } else {
      this.setValidationResponse(this.model.validationError);
    }
  },

  serializeForm: function(serializedArray) {
    var props = {};
    $.each(serializedArray, function(i, v) {
      props[v['name']] = v['value'];
    });
    return props;
  },

  setValidationResponse: function(text) {
    this.$('.validation-response').text(text);
  },

  handleSuccess: function(model, response, options) {
    debugger
    this.setValidationResponse('account successfully created!');
  },

  handleFail: function(model, response, options) {
    debugger
    this.setValidationResponse(response.errors);
  }
});
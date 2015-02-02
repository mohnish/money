M.SignupView = Backbone.View.extend({
  el: '#signup-form',

  events: {
    'submit': 'handleSubmit'
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var self = this;
    var props = this.serializeSignupForm(this.$el.serializeArray());
    var user = new M.User(props);

    if (user.isValid({ checkPassword: true })) {
      // this.setupJqXHR(user.save());
      debugger
      user.save({
        success: self.handleSuccess,
        error: self.handleFail
      });
      this.setValidationResponse('waiting...');
    } else {
      this.setValidationResponse(user.validationError);
    }
  },

  setupJqXHR: function(jqxhr) {
    jqxhr
      .done(this.handleDone)
      .fail(this.handleFail)
      .always(this.handleAlways);
  },

  serializeSignupForm: function(serializedArray) {
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
    var errorText = this.formatErrors();
    this.setValidationResponse();
  },

  formatErrors: function(errorsObject) {
    debugger
  }
});
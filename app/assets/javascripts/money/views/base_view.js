
M.BaseView = M.AbstractView.extend({
  createAttributesObject: function(serializedArray) {
    var props = {};
    $.each(serializedArray, function(i, v) {
      props[v['name']] = v['value'];
    });
    return props;
  },

  formatErrors: function(response) {
    return $.map(response.responseJSON.errors, function(errorText, field) {
      return field + ' ' + errorText;
    });
  },

  handleSync: function(model, response, options) {
    throw new Error('FIXME: implement handleSync in the subclass');
  },

  handleError: function(model, response, options) {
    var errors = this.formatErrors(response);
    this.setValidationResponse(errors.join(', '), 'danger');
  },

  handleInvalid: function(model, response, options) {
    this.setValidationResponse(response.join(', '), 'danger');
  },

  setValidationResponse: function(message, type) {
    var options = { el: '.validation-response', type: (type || 'info'), message: message };
    new M.AlertsView(options);
  },

  getUsername: function() {
    return localStorage.getItem('username');
  },

  signout: function(e) {
    e.preventDefault();
    M.dispatcher.trigger('m:signout:user');
  },

  showBills: function(e) {
    e.preventDefault();
    M.dispatcher.trigger('m:show:bills');
  },

  showProfile: function(e) {
    e.preventDefault();
    M.dispatcher.trigger('m:show:profile');
  },

  showCards: function(e) {
    e.preventDefault();
    M.dispatcher.trigger('m:show:payment_sources');
  },

  showSignin: function(e) {
    e.preventDefault();
    M.dispatcher.trigger('m:show:signin');
  },

  showSignup: function(e) {
    e.preventDefault();
    M.dispatcher.trigger('m:show:signup');
  }
});

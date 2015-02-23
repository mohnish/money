M.BaseView = Backbone.View.extend({
  templatePath: 'welcome/index',

  templatePathPrefix: 'money/templates/',

  setPageTitle: function(currentPageTitle) {
    if (currentPageTitle) {
      document.title = currentPageTitle + ' | Money';
    } else {
      document.title = 'Money';
    }

    return this;
  },

  template: function(data) {
    var path;

    if (_.isFunction(this.templatePath)) {
      path = this.templatePath();
    } else {
      path = this.templatePath;
    }

    return JST[this.templatePathPrefix + path](data);
  },

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
    this.setValidationResponse(errors.join(' '), 'error');
  },

  handleInvalid: function(model, response, options) {
    this.setValidationResponse(response.join(' '), 'error');
  },

  setValidationResponse: function(text, type) {
    // TODO: use the `type` add a class to the input
    // and pass in a selector to dynamically choose the element
    // to set the errors onto
    this.$('.validation-response').text(text);
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
  }
});

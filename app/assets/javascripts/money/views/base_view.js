M.BaseView = Backbone.View.extend({
  templatePath: 'welcome/index',

  templatePathPrefix: 'money/templates/',

  setPageTitle: function(currentPageTitle) {
    if (currentPageTitle) {
      document.title = currentPageTitle + ' | Money';
    } else {
      document.title = 'Money';
    }
  },

  template: function() {
    var path;

    if (_.isFunction(this.templatePath)) {
      path = this.templatePath();
    } else {
      path = this.templatePath;
    }

    return JST[this.templatePathPrefix + path];
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
      // TODO: See if this is the fastest way
      return field + ' ' + errorText;
    });
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
  }
});

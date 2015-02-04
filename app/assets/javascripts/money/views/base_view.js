M.BaseView = Backbone.View.extend({
  templatePath: 'welcome/index',

  templatePathPrefix: 'money/templates/',

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
  }
});

M.BaseView = Backbone.View.extend({
  templatePath: 'welcome/signin',

  templatePathPrefix: 'money/templates/',

  template: function() {
    if (typeof templatePath == 'function') {
      JST[templatePathPrefix + templatePath()];
    } else {
      JST[templatePathPrefix + templatePath];
    }
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

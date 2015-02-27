
M.AbstractView = Backbone.View.extend({
  templatePath: 'welcome/index',

  templatePathPrefix: 'money/templates/',

  setPageTitle: function(currentPageTitle) {
    if (currentPageTitle) {
      document.title = currentPageTitle + ' | money';
    } else {
      document.title = 'money';
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
  }
});


M.AlertsView = M.AbstractView.extend({
  templatePath: 'alerts/index',

  initialize: function(options) {
    this.options = this.setupOptions(options);
    this.render();
  },

  render: function() {
    this.$el.html(this.template(this.options));
    return this;
  },

  setupOptions: function(options) {
    var defaults = { type: 'danger', message: 'oops... an error occurred' };
    return _.defaults(options, defaults);
  }
});

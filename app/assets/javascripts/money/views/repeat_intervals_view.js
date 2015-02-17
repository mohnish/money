
M.RepeatIntervalsView = M.BaseView.extend({
  el: '#repeat-intervals',

  collection: new M.RepeatIntervals(),

  templatePath: 'repeat_intervals/index',

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.handleSync);
    this.listenTo(this.collection, 'error', this.handleError);
    this.collection.fetch();
  },

  render: function() {
    this.$el.html(this.template({ repeatIntervals: this.collection.toJSON() }));
    return this;
  },

  handleSync: function() {
    this.render();
  },

  handleError: function(collection, response, options) {
  }
});

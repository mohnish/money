
M.PaymentSourcesListView = M.BaseView.extend({
  el: '#payment-source-id',

  collection: new M.PaymentSources(),

  templatePath: 'payment_sources/list',

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.handleSync);
    this.listenTo(this.collection, 'error', this.handleError);
    this.collection.fetch();
  },

  render: function() {
    this.$el.html(this.template({ payment_sources: this.collection.toJSON() }));
    return this;
  },

  handleSync: function() {
    this.render();
  },

  handleError: function(collection, response, options) {
  }
});


M.BillsView = M.BaseView.extend({
  className: 'bills',

  collection: new M.Bills(),

  tagName: 'ul',

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.handleSync);
    this.listenTo(this.collection, 'error', this.handleError);
    this.collection.fetch();
  },

  render: function() {
    this.collection.each(this.appendBill, this);
    $('#money').html(this.el);

    return this;
  },

  appendBill: function(bill) {
    var billView = new M.BillView({ model: bill });
    this.$el.append(billView.render().el);
  },

  handleSync: function() {
    this.render();
  },

  handleError: function(collection, response, options) {
    $('#money').text(response.status + ' ' + response.statusText);
  }
});


M.BillsView = M.BaseView.extend({
  className: 'bills',

  collection: new M.Bills(),

  tagName: 'ul',

  templatePath: 'bills/index',

  events: {
    'click .condensed-bill': 'showBill'
  },

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.handleSync);
    this.listenTo(this.collection, 'error', this.handleError);
    this.collection.fetch();
  },

  render: function() {
    this.$el.html(this.template({ bills: this.collection.toJSON() }));
    $('#money').html(this.el);

    return this;
  },

  handleSync: function() {
    this.render();
  },

  handleError: function(collection, response, options) {
    $('#money').text(response.status + ' ' + response.statusText);
  },

  showBill: function(e) {
    this.trigger('m:show:bill', e.target.dataset.id);
  }
});

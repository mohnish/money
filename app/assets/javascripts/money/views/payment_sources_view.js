
M.PaymentSourcesView = M.BaseView.extend({
  className: 'payment-sources',

  tagName: 'ul',

  collection: new M.PaymentSources(),

  templatePath: 'payment_sources/index',

  events: {
    'click #signout': 'signout'
  },

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.handleSync);
    this.listenTo(this.collection, 'error', this.handleError);
    this.collection.fetch();
  },

  render: function() {
    var _this = this;

    this.collection.each(function(model) {
      var paymentSourceView = new M.PaymentSourceView({ model: model });
      _this.$el.append(paymentSourceView.render().el);
    });

    // FIXME: This needs to point to a user-data css id or
    // something like that
    $('#money').html(this.el);

    return this;
  },

  handleSync: function() {
    this.render();
  },

  handleError: function(collection, response, options) {
    $('#money').text(response.status + ' ' + response.statusText);
  }
});

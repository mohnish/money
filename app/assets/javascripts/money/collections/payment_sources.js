
M.PaymentSources = Backbone.Collection.extend({
  url: '/api/payment_sources',

  model: M.PaymentSource,

  initialize: function() {
    this.listenTo(M.dispatcher, 'm:reset:payment_sources', this.reset);
  }
});

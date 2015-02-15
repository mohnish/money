
M.PaymentSources = Backbone.Collection.extend({
  url: '/api/payment_sources',

  model: M.PaymentSource
});


M.Payments = Backbone.Collection.extend({
  url: '/api/payments',

  model: M.Payment,

  initialize: function() {
    this.listenTo(M.dispatcher, 'm:reset:payments', this.reset);
  }
});

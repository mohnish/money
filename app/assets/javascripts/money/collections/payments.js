
M.Payments = Backbone.Collection.extend({
  url: function() {
    return '/api/bills/' + this.billId + '/payments';
  },

  model: M.Payment,

  initialize: function() {
    this.listenTo(M.dispatcher, 'm:reset:payments', this.reset);
  }
});

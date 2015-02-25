
M.Payments = Backbone.Collection.extend({
  model: M.Payment,

  initialize: function() {
    this.listenTo(M.dispatcher, 'm:reset:payments', this.reset);
  }
});

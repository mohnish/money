
M.Bills = Backbone.Collection.extend({
  url: '/api/bills',

  model: M.Bill,

  initialize: function() {
    this.listenTo(M.dispatcher, 'm:reset:bills', this.clear);
  },

  clear: function(e) {
    this.reset();
  }
});

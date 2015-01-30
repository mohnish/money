var MoneyRouter = Backbone.Router.extend({
  routes: {
    'bills': 'bills',
    'bills/:billId': 'bills',
    'categories': 'categories',
    'payment_sources': 'payment_sources',
    'payment_sources/:paymentSourceId': 'payment_sources',
    'payments': 'payments',
    'payments/:paymentId': 'payments',
    'tags': 'tags',
    'users/:userId': 'users'
  },

  bills: function(billId) {
    console.log('arguments:', arguments);
  },
  categories: function() {
    console.log('arguments:', arguments);
  },
  payment_sources: function(paymentSourceId) {
    console.log('arguments:', arguments);
  },
  payments: function(paymentId) {
    console.log('arguments:', arguments);
  },
  tags: function() {
    console.log('arguments:', arguments);
  },
  users: function(userId) {
    console.log('arguments:', arguments);
  }
});

new MoneyRouter();
Backbone.history.start({ pushState: true });

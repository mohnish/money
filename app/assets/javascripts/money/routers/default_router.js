M.DefaultRouter = Backbone.Router.extend({
  initialize: function() {
  },

  routes: {
    '': 'signin',
    'signin': 'signin',
    'signup': 'signup',
    'bills(/)': 'bills',
    'bills/:id': 'showBill',
    'categories(/)': 'categories',
    'payment_sources(/)': 'paymentSources',
    'payment_sources/:id': 'showPaymentSource',
    'bills/:billId/payments(/)': 'payments',
    'bills/:billId/payments/:id': 'showPayment',
    'bills/:billId/tags(/)': 'tags',
    'tags(/)': 'tags',
    'profile': 'profile'
  },

  transition: function(currentView, newView) {
    // FIXME: implement this
  },

  signin: function() {
    var signinView = new M.SigninView();
    signinView.render();

    this.listenTo(signinView, 'signin:success', function() {
      signinView.remove();
      this.navigate('/profile', { trigger: true });
    });
  },

  signup: function() {
    var signupView = new M.SignupView();
    signupView.render();

    this.listenTo(signupView, 'signup:success', function() {
      signupView.remove();
      this.navigate('/signin', { trigger: true });
    });
  },

  bills: function() {
    console.log('bills');
  },

  showBill: function(id) {
    console.log('showBill:', id);
  },

  categories: function() {
    console.log('categories:');
  },

  paymentSources: function() {
    var paymentSources = new M.PaymentSources();
    var paymentSourcesView = new M.PaymentSourcesView({
      collection: paymentSources
    });
  },

  showPaymentSource: function(id) {
    console.log('showPaymentSource:', id);
  },

  payments: function(billId) {
    console.log('payments');
  },

  showPayment: function(id) {
    console.log('showPayment:', id);
  },

  tags: function() {
    console.log('tags');
  },

  profile: function(username) {
    var profileView = new M.ProfileView();
  }
});
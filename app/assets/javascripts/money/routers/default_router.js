M.DefaultRouter = Backbone.Router.extend({
  initialize: function() {
    this.listenTo(M.dispatcher, 'm:show:bills', function() {
      this.navigate('/bills', { trigger: true });
    });

    this.listenTo(M.dispatcher, 'm:show:bill', function(id) {
      this.navigate('/bills/' + id, { trigger: true });
    });

    this.listenTo(M.dispatcher, 'm:show:profile', function() {
      this.navigate('/profile', { trigger: true });
    });

    this.listenTo(M.dispatcher, 'm:signup:success', function() {
      this.navigate('/signin', { trigger: true });
    });

    this.listenTo(M.dispatcher, 'm:signin:success', function() {
      this.navigate('/profile', { trigger: true });
    });
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

  signin: function() {
    var signinView = new M.SigninView();
    signinView.render();
  },

  signup: function() {
    var signupView = new M.SignupView();
    signupView.render();
  },

  bills: function() {
    M.dispatcher.trigger('m:reset:bills');
    new M.BillsView();
  },

  showBill: function(id) {
    var bill = new M.Bill({ id: id });
    new M.BillView({ model: bill });
  },

  categories: function() {
    console.log('categories:');
  },

  paymentSources: function() {
    new M.PaymentSourcesView();
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
    new M.ProfileView();
  }
});
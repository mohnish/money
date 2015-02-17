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

  signin: function() {
    var signinView = new M.SigninView();
    signinView.render();

    this.listenTo(signinView, 'm:signin:success', function() {
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
    var billsView = new M.BillsView();

    this.listenTo(billsView, 'm:show:bill', function(id) {
      billsView.remove();
      this.navigate('/bills/' + id, { trigger: true });
    });
  },

  showBill: function(id) {
    var bill = new M.Bill({ id: id });
    var billView = new M.BillView({ model: bill });

    this.listenTo(billView, 'm:show:bills', function() {
      billView.remove();
      this.navigate('/bills', { trigger: true });
    });
  },

  categories: function() {
    console.log('categories:');
  },

  paymentSources: function() {
    var paymentSourcesView = new M.PaymentSourcesView();
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

    this.listenTo(profileView, 'm:show:bills', function(bill) {
      profileView.remove();
      this.navigate('/bills', { trigger: true });
    });
  }
});
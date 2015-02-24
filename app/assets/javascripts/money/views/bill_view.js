
M.BillView = M.BaseView.extend({
  className: 'bill',

  events: {},

  templatePath: 'bills/show',

  events: {
    'click #show-payment-sources': 'showCards',
    'click #show-bills': 'showBills',
    'click #profile': 'showProfile',
    'click #signout': 'signout',
    'submit #create-payment': 'handleSubmit'
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.handleSync);
    this.model.fetch();
  },

  render: function() {
    this.setPageTitle(this.model.get('name'));
    this.$el.html(this.template(this.model.toJSON()));
    $('#money').html(this.el);
    this.populatePaymentSources();
    return this;
  },

  populatePaymentSources: function() {
    var paymentSourcesListView = new M.PaymentSourcesListView();
    this.$('#payment-source-id').html(paymentSourcesListView.render().el);
  },

  handleSync: function() {
    this.render();
  },

  handlePaymentSync: function(model, response, options) {
    this.model.fetch();
  },

  handleSubmit: function(e) {
    e.preventDefault();
    this.setupPayment().save();
    return this;
  },

  setupPayment: function() {
    var props = this.createAttributesObject(this.$('#create-payment').serializeArray());
    var payment = new M.Payment(props);
    this.listenTo(payment, 'sync', this.handlePaymentSync);
    this.listenTo(payment, 'invalid', this.handleInvalid);
    this.listenTo(payment, 'error', this.handleError);
    return payment;
  }
});

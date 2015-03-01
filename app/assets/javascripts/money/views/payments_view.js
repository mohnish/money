
M.PaymentsView = M.BaseView.extend({
  el: '#manage-payments',

  templatePath: 'payments/index',

  events: {
    'submit #create-payment': 'handleSubmit'
  },

  initialize: function() {
    this.listenTo(this.collection, 'add', this.addPayment);
    this.listenTo(this.collection, 'error', this.handleError);
    this.listenTo(this.collection, 'invalid', this.handleInvalid);
    this.render();
    this.collection.fetch();
  },

  render: function() {
    this.$el.html(this.template({ billId: this.collection.billId }));
    this.populatePaymentSources();
    return this;
  },

  populatePaymentSources: function() {
    var paymentSourcesListView = new M.PaymentSourcesListView();
    this.$('#payment-source-id').html(paymentSourcesListView.render().el);
  },

  addPayment: function(payment) {
    var paymentView = new M.PaymentView({ model: payment });
    this.$('.payments').append(paymentView.render().el);
  },

  handleSubmit: function(e) {
    e.preventDefault();
    var props = this.createAttributesObject(this.$('#create-payment').serializeArray());
    var payment = this.collection.create(props, { wait: true });
  }
});

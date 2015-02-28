
M.PaymentSourcesView = M.BaseView.extend({
  className: 'manage-payment-sources',

  collection: new M.PaymentSources(),

  templatePath: 'payment_sources/index',

  events: {
    'submit #create-payment-source': 'handleSubmit',
    'click .show-payment-sources': 'showCards',
    'click .show-profile': 'showProfile',
    'click .show-bills': 'showBills',
    'click .signout': 'signout'
  },

  initialize: function() {
    this.listenTo(this.collection, 'add', this.addPaymentSource);
    this.listenTo(this.collection, 'error', this.handleError);
    this.render();
    this.collection.fetch();
  },

  render: function() {
    this.setPageTitle('your cards');
    this.$el.html(this.template());
    $('#money').html(this.el);
    return this;
  },

  addPaymentSource: function(paymentSource) {
    var paymentSourceView = new M.PaymentSourceView({ model: paymentSource });
    this.$('.payment-sources').append(paymentSourceView.render().el);
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var props = this.createAttributesObject(this.$('#create-payment-source').serializeArray());
    var newPaymentSource = this.collection.create(props, { wait: true });

    if (newPaymentSource.isValid()) {
      this.setValidationResponse('waiting...');
    } else {
      this.setValidationResponse(newPaymentSource.validationError, 'danger');
    }
  }
});

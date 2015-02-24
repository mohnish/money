
M.BillView = M.BaseView.extend({
  className: 'bill',

  templatePath: 'bills/show',

  events: {
    'click #show-payment-sources': 'showCards',
    'click #show-bills': 'showBills',
    'click #profile': 'showProfile',
    'click #signout': 'signout'
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.handleSync);
    this.model.fetch();
  },

  render: function() {
    this.setPageTitle(this.model.get('name'));
    this.$el.html(this.template(this.model.toJSON()));
    $('#money').html(this.el);
    var payments = new M.Payments();
    payments.billId = this.model.get('id');
    var paymentsView = new M.PaymentsView({ collection: payments });
    return this;
  },

  handleSync: function() {
    this.render();
  }
});

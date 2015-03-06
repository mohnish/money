
M.BillView = M.BaseView.extend({
  className: 'bill',

  templatePath: 'bills/show',

  events: {
    'click .show-payment-sources': 'showCards',
    'click .cancel-edit-bill': 'cancelEditBill',
    'click .show-profile': 'showProfile',
    'click .show-bills': 'showBills',
    'click .edit-bill': 'editBill',
    'click .signout': 'signout'
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.handleSync);
    this.model.fetch();
  },

  render: function() {
    this.setPageTitle(this.model.get('name'));
    this.$el.html(this.template(this.model.toJSON()));
    $('#money').html(this.el);
    this.model.payments.reset();
    new M.PaymentsView({ collection: this.model.payments });
    if (this.editBillView) this.delegateEvents();
    return this;
  },

  handleSync: function() {
    this.render();
  },

  editBill: function(e) {
    this.editBillView = new M.EditBillView({ model: this.model });
  },

  cancelEditBill: function(e) {
    this.$('#edit-bill-section').empty();
  }
});

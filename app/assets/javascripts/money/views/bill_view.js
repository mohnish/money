
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
    if (this.editBillView) this.resetView();
    new M.PaymentsView({ collection: this.model.payments });
    return this;
  },

  resetView: function() {
    // TODO: if the payments of available, instead of resetting
    // them, it'd be nicer to just reuse them. for that to happen,
    // the payments_view should be updated to check if the payments
    // are present (and not stale) or not and act accordingly.
    this.model.payments.reset();
    this.delegateEvents();
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

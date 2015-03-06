
M.PaymentSourceView = M.BaseView.extend({
  className: 'payment-source list-group-item',

  templatePath: 'payment_sources/show',

  tagName: 'li',

  events: {
    'click .edit-payment-source': 'editPaymentSource'
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  },

  editPaymentSource: function(e) {
    var editPaymentSourceView = new M.EditPaymentSourceView({ model: this.model, el: this.el });
    this.listenTo(editPaymentSourceView, 'm:render:payment_sources', this.render);
  }
});

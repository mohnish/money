
M.PaymentSourceView = M.BaseView.extend({
  className: 'payment-source',

  tagName: 'li',

  templatePath: 'payment_sources/show',

  render: function() {
    this.$el.text(this.template(this.model.toJSON()))
    return this;
  }
});

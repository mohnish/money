
M.PaymentSourceView = M.BaseView.extend({
  className: 'payment-source',

  templatePath: 'payment_sources/show',

  tagName: 'li',

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});

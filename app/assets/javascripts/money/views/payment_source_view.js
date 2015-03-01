
M.PaymentSourceView = M.BaseView.extend({
  className: 'payment-source list-group-item',

  templatePath: 'payment_sources/show',

  tagName: 'li',

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});

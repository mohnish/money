
M.PaymentView = M.BaseView.extend({
  tagName: 'li',

  className: 'payment list-group-item',

  templatePath: 'payments/show',

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});

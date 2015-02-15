
M.BillView = M.BaseView.extend({
  className: 'bill',

  tagName: 'li',

  templatePath: 'bills/show',

  render: function() {
    this.$el.text(this.template(this.model.toJSON()));
    return this;
  }
});

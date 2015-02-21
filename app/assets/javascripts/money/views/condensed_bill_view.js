
M.CondensedBillView = M.BaseView.extend({
  className: 'condensed-bill',

  templatePath: 'bills/condensed',

  tagName: 'li',

  events: {
    'click': 'showBill'
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  },

  showBill: function(e) {
    M.dispatcher.trigger('m:show:bill', this.model.get('id'));
  }
});

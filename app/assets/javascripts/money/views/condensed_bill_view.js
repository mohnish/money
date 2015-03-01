
M.CondensedBillView = M.BaseView.extend({
  className: 'condensed-bill list-group-item',

  templatePath: 'bills/condensed',

  tagName: 'a',

  attributes: function() {
    return { href: '/bills/' + this.model.get('id') };
  },

  events: {
    'click': 'showBill'
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  },

  showBill: function(e) {
    e.preventDefault();
    M.dispatcher.trigger('m:show:bill', this.model.get('id'));
  }
});

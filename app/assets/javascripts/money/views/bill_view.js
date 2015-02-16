
M.BillView = M.BaseView.extend({
  className: 'bill',

  tagName: 'li',

  events: {
    'click': 'show'
  },

  attributes: function() {
    return { 'data-id': this.model.get('id') }
  },

  templatePath: 'bills/show',

  render: function() {
    this.$el.text(this.template(this.model.toJSON()));
    return this;
  }
});

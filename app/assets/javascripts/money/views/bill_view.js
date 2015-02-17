
M.BillView = M.BaseView.extend({
  className: 'bill',

  events: {},

  templatePath: 'bills/show',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.handleSync);
    this.model.fetch();
  },

  render: function() {
    this.$el.text(this.template(this.model.toJSON()));
    $('#money').html(this.el);
    return this;
  },

  handleSync: function() {
    this.render();
  }
});

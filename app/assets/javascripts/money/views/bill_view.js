
M.BillView = M.BaseView.extend({
  className: 'bill',

  events: {},

  templatePath: 'bills/show',

  events: {
    'click #profile': 'showProfile',
    'click #show-bills': 'showBills'
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.handleSync);
    this.model.fetch();
  },

  render: function() {
    this.setPageTitle(this.model.get('name'));
    this.$el.html(this.template(this.model.toJSON()));
    $('#money').html(this.el);
    return this;
  },

  handleSync: function() {
    this.render();
  },

  showProfile: function(e) {
    e.preventDefault();

    M.dispatcher.trigger('m:show:profile');
  },

  showBills: function(e) {
    e.preventDefault();
    this.model.clear();
    M.dispatcher.trigger('m:show:bills');
  }
});

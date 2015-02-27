M.ProfileView = M.BaseView.extend({
  className: 'profile',

  model: new M.User(),

  templatePath: 'users/profile',

  events: {
    'click #show-payment-sources': 'showCards',
    'click #show-bills': 'showBills',
    'click #signout': 'signout'
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.handleSync);
    this.listenTo(this.model, 'error', this.handleError);
    this.model.fetch();
  },

  render: function() {
    this.setPageTitle(this.model.get('username'));
    $('#money').html(this.$el.html(this.template(this.model.toJSON())));
    return this;
  },

  handleSync: function() {
    this.render();
  },

  handleError: function() {
    console.log('handle error in profile view');
  }
});
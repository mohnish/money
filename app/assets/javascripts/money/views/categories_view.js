
M.CategoriesView = M.BaseView.extend({
  el: '#categories',

  collection: new M.Categories(),

  templatePath: 'categories/index',

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.handleSync);
    this.listenTo(this.collection, 'error', this.handleError);
    this.collection.fetch();
  },

  render: function() {
    this.$el.html(this.template({ categories: this.collection.toJSON() }));
    return this;
  },

  handleSync: function() {
    this.render();
  },

  handleError: function(collection, response, options) {
  }
});

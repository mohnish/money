
M.BillsView = M.BaseView.extend({
  className: 'bills',

  collection: new M.Bills(),

  tagName: 'ul',

  templatePath: 'bills/index',

  events: {
    'click .condensed-bill': 'showBill',
    'submit #create-bill-form': 'handleSubmit'
  },

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.handleSync);
    this.listenTo(this.collection, 'error', this.handleError);
    this.collection.fetch();
  },

  render: function() {
    this.$el.html(this.template({ bills: this.collection.toJSON() }));
    $('#money').html(this.el);
    this.populateCategories();
    this.populateRepeatIntervals();

    return this;
  },

  handleSync: function() {
    this.render();
  },

  handleError: function(collection, response, options) {
    $('#money').text(response.status + ' ' + response.statusText);
  },

  showBill: function(e) {
    this.trigger('m:show:bill', e.target.dataset.id);
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var props = this.createAttributesObject(this.$('#create-bill-form').serializeArray());
    // FIXME: CONVERT date format and tags to array here
    var newBill = this.collection.create(props, { wait: true });

    if (newBill.isValid()) {
      this.setValidationResponse('waiting...');
    } else {
      this.setValidationResponse(newBill.validationError);
    }
  },

  populateCategories: function() {
    var categoriesView = new M.CategoriesView();
    categoriesView.render();
  },

  populateRepeatIntervals: function() {
    var repeatIntervalsView = new M.RepeatIntervalsView();
    repeatIntervalsView.render();
  }
});

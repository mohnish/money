
M.BillsView = M.BaseView.extend({
  className: 'bills',

  collection: new M.Bills(),

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
    props = this.formatParams(props);
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
  },

  // "yyyy-mm-dd" => "mm/dd/yyyy"
  formatDate: function(date) {
    var val = date.split('-');
    return val.concat([val.shift()]).join('/');
  },

  // format next_due_date: "yyyy-mm-dd" => "mm/dd/yyyy"
  // format tags: "one, two, three" => ["one", "two", "three"]
  formatParams: function(props) {
    props.next_due_date = this.formatDate(props.next_due_date);
    props.tags = props.tags.split(',');
    return props;
  }
});

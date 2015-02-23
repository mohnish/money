
M.BillsView = M.BaseView.extend({
  className: 'bills',

  collection: new M.Bills(),

  templatePath: 'bills/index',

  events: {
    'click #show-payment-sources': 'showCards',
    'submit #create-bill-form': 'handleSubmit',
    'click #profile': 'showProfile',
    'click #signout': 'signout'
  },

  initialize: function() {
    this.listenTo(this.collection, 'add', this.addBill);
    this.listenTo(this.collection, 'error', this.handleError);
    this.render();
    this.collection.fetch();
  },

  render: function() {
    this.setPageTitle('your bills');
    this.$el.html(this.template());
    $('#money').html(this.el);
    this.populateCategories();
    this.populateRepeatIntervals();
    return this;
  },

  addBill: function(bill) {
    var condensedBillView = new M.CondensedBillView({ model: bill });
    this.$('.condensed-bills').append(condensedBillView.render().el);
  },

  // FIXME: this needs to be replaced with better error handling
  handleError: function(collection, response, options) {
    $('#money').text(response.status + ' ' + response.statusText);
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var props = this.createAttributesObject(this.$('#create-bill-form').serializeArray());
    props = this.formatParams(props);
    var newBill = this.collection.create(props, { wait: true });

    if (newBill.isValid()) {
      this.setValidationResponse('');
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

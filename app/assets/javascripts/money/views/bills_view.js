
M.BillsView = M.BaseView.extend({
  className: 'bills',

  collection: new M.Bills(),

  templatePath: 'bills/index',

  events: {
    'click #toggle-create-bill-form': 'toggleForm',
    'submit #create-bill-form': 'handleSubmit',
    'click .show-payment-sources': 'showCards',
    'change #repeat-intervals': 'togglePaymentSourceSelection',
    'click .show-profile': 'showProfile',
    'click .show-bills': 'showBills',
    'click .signout': 'signout'
  },

  initialize: function() {
    this.listenTo(this.collection, 'add', this.addBill);
    this.listenTo(this.collection, 'error', this.handleError);
    this.listenTo(this.collection, 'invalid', this.handleInvalid);
    this.render();
    this.collection.fetch();
  },

  render: function() {
    this.setPageTitle('bills');
    this.$el.html(this.template());
    $('#money').html(this.el);
    this.populateCategories();
    this.populateRepeatIntervals();
    this.populatePaymentSources();
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
    var newBill = this.collection.create(props, this.validationOptions());

    newBill.on('sync', function(e) {
      this.resetForm(this.$('#create-bill-form')[0]);
    }, this);
  },

  validationOptions: function() {
    return { wait: true, nonRecurringBill: this.isNonRecurringBill() };
  },

  isNonRecurringBill: function(e) {
    return ('one_time' == this.$('#repeat-intervals option:selected').data('interval'))
  },

  populateCategories: function() {
    var categoriesView = new M.CategoriesView();
    categoriesView.render();
  },

  populateRepeatIntervals: function() {
    var repeatIntervalsView = new M.RepeatIntervalsView();
    repeatIntervalsView.render();
  },

  populatePaymentSources: function() {
    var paymentSourcesListView = new M.PaymentSourcesListView();
    this.$('#payment-source-id').html(paymentSourcesListView.render().el);
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
  },

  toggleForm: function(e) {
    e.preventDefault();
    this.$('#create-bill-form').toggle('fast');
    this.toggleText(this.$('#toggle-create-bill-form'));
  },

  toggleText: function($link) {
    if ('+ create bill' == $link.text()) {
      $link.text('- create bill');
    } else {
      $link.text('+ create bill');
    }
  },

  togglePaymentSourceSelection: function(e) {
    e.preventDefault();
    var $paymentSourceEl = $(e.target);
    var interval = $paymentSourceEl.find(':selected').data('interval');
    if ('one_time' == interval) {
      this.$('.select-card-form-group').show('fast');
    } else {
      this.$('.select-card-form-group').hide('fast');
    }
  }
});


M.EditBillView = M.BaseView.extend({
  el: '#edit-bill-section',

  templatePath: 'bills/edit',

  events: {
    'submit #edit-bill-form': 'handleSubmit',
    'change #repeat-intervals': 'togglePaymentSourceSelection'
  },

  initialize: function() {
    this.render();
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    this.populateCategories();
    this.populateRepeatIntervals();
    return this;
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var props = this.createAttributesObject(this.$('#edit-bill-form').serializeArray());
    props = this.formatParams(props);
    this.model.save(props);
  },

  populateCategories: function() {
    var categoriesView = new M.CategoriesView();
    categoriesView.selectedId = this.model.get('category').id;
    categoriesView.render();
  },

  populateRepeatIntervals: function() {
    var repeatIntervalsView = new M.RepeatIntervalsView();
    repeatIntervalsView.selectedId = this.model.get('repeat_interval').id;
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

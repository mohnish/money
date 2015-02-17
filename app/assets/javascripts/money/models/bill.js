
M.Bill = Backbone.Model.extend({
  defaults: {
    name: '',
    next_due_date: '',
    amount: '',
    repeat_interval: 1,
    tags: [],
    category: '',
    payments: []
  },

  url: function() {
    if (this.isNew()) {
      return '/api/bills';
    } else {
      return '/api/bills/' + this.get('id');
    }
  },

  validate: function(attrs, options) {
    var errors = [];

    if(_.isEmpty(attrs.name)) errors.push('bill name is invalid');
    if(_.isEmpty(attrs.next_due_date)) errors.push('next due date is invalid');
    if(_.isEmpty(attrs.amount)) errors.push('amount is invalid');
    if(_.isEmpty(attrs.repeat_interval)) errors.push('repeat interval is invalid');
    if(_.isEmpty(attrs.category)) errors.push('category name is invalid');

    if (!_.isEmpty(errors)) return errors;
  }
});

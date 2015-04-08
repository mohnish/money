
M.Bill = Backbone.Model.extend({
  defaults: {
    name: '',
    next_due_date: '',
    amount: '',
    repeat_interval: 1,
    tags: [],
    category: ''
  },

  initialize: function() {
    this.payments = new M.Payments();
    this.payments.url = '/api/bills/' + this.get('id') + '/payments';

    // this is to avoid https://github.com/jashkenas/backbone/issues/1845
    // we basically propagate the error from the model to the
    // collection and let the collection view handle the error
    this.on('error', function(model, response, options) {
      this.collection.trigger('error', model, response, options);
    });

    this.on('invalid', function(model, response, options) {
      this.collection.trigger('invalid', model, response, options);
    });
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
    if(options.nonRecurringBill && _.isEmpty(attrs.payment_source_id)) errors.push("please select a card for payment. if you haven't added one, please go to cards page to add one");

    if (!_.isEmpty(errors)) return errors;
  }
});


M.Payment = Backbone.Model.extend({
  defaults: {
    amount: '',
    bill_id: '',
    payment_source_id: '',
    notes: []
  },

  initialize: function() {
    // this is to avoid https://github.com/jashkenas/backbone/issues/1845
    // we basically propagate the error from the model to the
    // collection and let the collection view handle the error
    this.on('error', function(model, response, options) {
      this.collection.trigger('error', model, response, options);
    });
  },

  validate: function(attrs, options) {
    var errors = [];

    if (!_.isEmpty(errors)) return errors;
  }
});

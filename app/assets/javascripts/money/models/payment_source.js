
M.PaymentSource = Backbone.Model.extend({
  defaults: {
    name: '',
    type: 'CreditCard'
  },

  initialize: function() {
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

  validate: function(attrs, options) {
    var errors = [];

    if(_.isEmpty(attrs.name)) errors.push('name is invalid');
    if(_.isEmpty(attrs.type)) errors.push('type is invalid');

    if (!_.isEmpty(errors)) return errors;
  }
});

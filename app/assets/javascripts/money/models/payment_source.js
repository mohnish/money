
M.PaymentSource = Backbone.Model.extend({
  defaults: {
    name: '',
    type: 'CreditCard'
  },

  validate: function(attrs, options) {
    var errors = [];

    if (!_.isEmpty(errors)) return errors;
  }
});

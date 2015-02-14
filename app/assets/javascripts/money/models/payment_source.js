
M.PaymentSource = Backbone.Model.extend({
  defaults: {
    name: '',
    type: 'Cash'
  },

  validate: function(attrs, options) {
    var errors = [];

    if (!_.isEmpty(errors)) return errors;
  }
});

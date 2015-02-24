
M.Payment = Backbone.Model.extend({
  defaults: {
    amount: '',
    bill_id: '',
    payment_source_id: '',
    notes: []
  },

  validate: function(attrs, options) {
    var errors = [];

    if(_.isEmpty(attrs.amount)) errors.push('payment amount is invalid');
    if(_.isEmpty(attrs.bill_id)) errors.push('please select a bill');
    if(_.isEmpty(attrs.payment_source_id)) errors.push('please select a valid card');

    if (!_.isEmpty(errors)) return errors;
  }
});

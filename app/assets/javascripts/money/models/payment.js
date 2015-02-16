
M.Payment = Backbone.Model.extend({
  defaults: {
    name: '',
    next_due_date: '',
    amount: '',
    repeat_interval: 1,
    tags: [],
    category: ''
  },

  validate: function(attrs, options) {
    var errors = [];

    if (!_.isEmpty(errors)) return errors;
  }
});

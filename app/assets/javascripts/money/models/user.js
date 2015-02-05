
M.User = Backbone.Model.extend({
  url: '/api/users',

  defaults: {
    username: '',
    email_address: '',
    first_name: '',
    last_name: '',
    phone_number: '',
    avatar: ''
  },

  validate: function(attrs, options) {
    var errors = [];
    if (_.isEmpty(attrs.username)) errors.push('username is invalid');
    if (_.isEmpty(attrs.email_address)) errors.push('email address is invalid');
    if (_.isEmpty(attrs.first_name)) errors.push('first name is invalid');
    if (_.isEmpty(attrs.last_name)) errors.push('last name is invalid');
    if (options.checkPassword && _.isEmpty(attrs.password)) errors.push('password is invalid');
    if (!_.isEmpty(attrs.phone_number) && !(/^[1-9]\d{9}$/).test(attrs.phone_number)) errors.push('phone number is invalid');
    if (!_.isEmpty(errors)) return errors;
  }
});


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
    if (options.checkPassword && _.isEmpty(attrs.password)) return 'password is invalid';
    if (_.isEmpty(attrs.username)) return 'username is invalid';
    if (_.isEmpty(attrs.email_address)) return 'email address is invalid';
    if (_.isEmpty(attrs.first_name)) return 'first name is invalid';
    if (_.isEmpty(attrs.last_name)) return 'last name is invalid';
    if (!_.isEmpty(attrs.phone_number) && !(/^[1-9]\d{9}$/).test(attrs.phone_number)) return 'phone number is invalid';
  }
});

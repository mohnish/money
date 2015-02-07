M.Authentication = Backbone.Model.extend({
  defaults: {
    username: '',
    password: '',
    grant_type: 'password'
  },

  url: '/oauth/token',

  validate: function(attrs, options) {
    var errors = [];

    if(_.isEmpty(attrs.username)) errors.push('username is invalid');
    if(_.isEmpty(attrs.password)) errors.push('password is invalid');

    if (!_.isEmpty(errors)) return errors;
  }
});
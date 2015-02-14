M.Authentication = Backbone.Model.extend({
  defaults: {
    username: '',
    password: '',
    access_token: '',
    grant_type: 'password'
  },

  url: '/oauth/token',

  validate: function(attrs, options) {
    var errors = [];

    if(_.isEmpty(attrs.username)) errors.push('username is invalid');
    if(options.checkPassword && _.isEmpty(attrs.password)) errors.push('password is invalid');

    if (!_.isEmpty(errors)) return errors;
  },

  removePassword: function() {
    this.set({ password: '' });
    return this;
  },

  destroyExistingToken: function() {
    localStorage.removeItem('access_token');
    return this;
  },

  persistTokenLocally: function() {
    localStorage.setItem('access_token', this.get('access_token'));
    return this;
  }
});
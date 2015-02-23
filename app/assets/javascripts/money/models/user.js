
M.User = Backbone.Model.extend({
  urlRoot: '/api/users',

  sync: function(method, model, options) {
    if ('read' == method) options.url = '/api/users/me'
    return Backbone.sync(method, model, options);
  },

  defaults: {
    username: '',
    email_address: '',
    first_name: '',
    last_name: '',
    phone_number: '',
    avatar: ''
  },

  toJSON: function() {
    return _.extend({ memberSince: this.memberSince() }, this.attributes);
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
  },

  removePassword: function() {
    this.set({ password: '' });
    return this;
  },

  destroyExistingToken: function() {
    localStorage.removeItem('access_token');
    return this;
  },

  memberSince: function() {
    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    var joiningDate = new Date(this.get('member_since'));
    var month = months[joiningDate.getMonth()];
    return month + ' ' + joiningDate.getDate() + ', ' + joiningDate.getFullYear();
  }
});

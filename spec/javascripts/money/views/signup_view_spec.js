describe('M.SignupView', function() {
  var view;

  beforeEach(function() {
    view = new M.SignupView();
  });

  describe('#serializeSignupForm', function() {
    it('returns a value', function() {
      var input = [
        { name: 'username', value: 'mt' },
        { name: 'email_address', value: 'mt@example.com' }
      ];
      var output = { username: 'mt', email_address: 'mt@example.com' };

      expect(view.serializeForm(input)).toEqual(output);
    });
  });

  describe('#el', function() {
    it('returns the el', function() {
      expect(view.el).toBe('#signup-form');
    });
  });
});
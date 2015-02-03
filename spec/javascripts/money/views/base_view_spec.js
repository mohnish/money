describe('M.SignupView', function() {
  var view;

  beforeEach(function() {
    view = new M.BaseView();
  });

  describe('#createAttributesObject', function() {
    it('returns a value', function() {
      var input = [
        { name: 'username', value: 'mt' },
        { name: 'email_address', value: 'mt@example.com' }
      ];
      var output = { username: 'mt', email_address: 'mt@example.com' };

      expect(view.createAttributesObject(input)).toEqual(output);
    });
  });
});

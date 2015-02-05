describe('M.BaseView', function() {
  var view;

  beforeEach(function() {
    view = new M.BaseView();
  });

  describe('#createAttributesObject', function() {
    it('returns an atrributes object', function() {
      var input = [
        { name: 'username', value: 'mt' },
        { name: 'email_address', value: 'mt@example.com' }
      ];
      var expected = { username: 'mt', email_address: 'mt@example.com' };

      expect(view.createAttributesObject(input)).toEqual(expected);
    });
  });

  describe('#formatErrors', function() {
    it('returns an array of error messages', function() {
      var input = {
        responseJSON: {
          errors: {
            username: ['has been taken'],
            email_address: ['has been taken']
          }
        }
      };
      var expected = ['username has been taken', 'email_address has been taken'];

      expect(view.formatErrors(input)).toEqual(expected);
    });
  });

  describe('#templatePath', function() {
    it('returns welcome/index (default template path)', function() {
      expect(view.templatePath).toBe('welcome/index');
    });
  });

  xdescribe('#template', function() {
    describe('when templatePath is a function', function() {
      it('returns the template', function() {
        // TODO: this needs to be updated to either mock an elem
        // or use a test template
        expect(view.template()).toBeUndefined();
      });
    });

    describe('when templatePath is a string', function() {
      it('returns the template', function() {
        // TODO: this needs to be updated to either mock an elem
        // or use a test template
        expect(view.template()).toBeUndefined();
      });
    });
  });
});

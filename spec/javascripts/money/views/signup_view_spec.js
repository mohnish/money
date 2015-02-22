describe('M.SignupView', function() {
  var view;

  beforeEach(function() {
    view = new M.SignupView();
  });

  describe('#el', function() {
    it('returns the el', function() {
      expect(view.$el.prop('class')).toBe('signup');
    });
  });
});

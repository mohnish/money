describe('M.SigninView', function() {
  var view;

  beforeEach(function() {
    view = new M.SigninView();
  });

  describe('#el', function() {
    it('returns the el', function() {
      expect(view.$el.selector).toBe('#money');
    });
  });
});
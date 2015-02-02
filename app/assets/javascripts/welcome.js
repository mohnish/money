
$(function() {
  new M.DefaultRouter();
  new M.SignupView();
  Backbone.history.start({ pushState: true });
});

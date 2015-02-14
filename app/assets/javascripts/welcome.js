
$(function() {
  Backbone.sync = (function(sync){
    var customSync = function(method, model, options) {
      var accessToken = localStorage.getItem('access_token');

      if (null != accessToken) {
        options.contentType = 'application/json';
        options.data = options.data || {};
        if (model && _.contains(['create', 'update', 'patch'], method)) {
          JSON.stringify(_.extend(options.data, { access_token: accessToken }, model.toJSON()));
        } else {
          _.extend(options.data, { access_token: accessToken });
        }
      }

      return sync(method, model, options);
    };

    return customSync;
  })(Backbone.sync);

  var router = new M.DefaultRouter();
  Backbone.history.start({ pushState: true });
});

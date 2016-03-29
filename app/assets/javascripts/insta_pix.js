window.InstaPix = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var router = new InstaPix.Routers.Router({
      $rootEl: $('#content'),
      instaCollections: new InstaPix.Collections.InstaCollections()
    });

    Backbone.history.start();
  }
};
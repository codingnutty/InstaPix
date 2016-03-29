InstaPix.Collections.Posts = Backbone.Collection.extend({
  url: "api/v1/posts",

  model: InstaPix.Models.Post,
});
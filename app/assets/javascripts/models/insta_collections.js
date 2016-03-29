InstaPix.Models.InstaCollection = Backbone.Model.extend({
  urlRoot: "api/v1/collections",

  posts: function () {
    if (!this._posts) {
      this._posts = new InstaPix.Collections.Posts([], {instaCollection: this});
    }

    return this._posts;
  },

  parse: function (response) {
    if (response.posts) {
      this.posts().set(response.posts, {parse: true});
      delete response.posts;
    }

    return response;
  }
})
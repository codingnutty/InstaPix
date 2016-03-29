InstaPix.Collections.InstaCollections = Backbone.Collection.extend({
  url: "api/v1/collections",

  model: InstaPix.Models.InstaCollection,
    getOrFetch: function (id) {
    var collection = this;
    var widget = collection.get(id);
    if (widget) {
      widget.fetch();
    } else {
      widget = new collection.model({ id: id });
      collection.add(widget);
      widget.fetch({
        error: function () { collection.remove(widget); }
      });
    }
    return widget;
  }

})
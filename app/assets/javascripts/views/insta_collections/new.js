InstaPix.Views.InstaCollectionsNew = Backbone.View.extend({
  template: JST['insta_collections/new'],

  className: "container",

  events: {
    "submit form": "postInstaCollection",
  },

  render: function () {
    var renderedContent = this.template({
      collection: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  postInstaCollection: function (event) {
    event.preventDefault();
     var data = $(event.currentTarget).serializeJSON().collection;
    // var a = $(event.currentTarget).serializeArray();
    // var data = {};
    // $.each(a, function() {
    //     if (data[this.name] !== undefined) {
    //         if (!data[this.name].push) {
    //             data[this.name] = [data[this.name]];
    //         }
    //         data[this.name].push(this.value || '');
    //     } else {
    //         data[this.name] = this.value || '';
    //     }
    // });
    data.start_date = Date.parse(data.start_date) / 1000;
    data.end_date   = Date.parse(data.end_date) / 1000;
    this.model.set(data);
    this.model.save({}, {
      success: function () {
        this.collection.add(this.model);
        Backbone.history.navigate(
          "collections/" + this.model.id,
          { trigger: true }
        );
      }.bind(this),
    });
     this.$el.html(JST['shared/loading']);
  }
});
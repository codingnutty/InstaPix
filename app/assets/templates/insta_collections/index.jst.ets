<h1>Collections</h1>

<% if (!!instaCollections.length) { %>
<ul>
  <% for (var i = 0; i < instaCollections.length; i++) { %>
    <li><a href="#/collections/<%= instaCollections.models[i].id %>">
      <%= instaCollections.models[i].escape("tag") %>
    </a></li>
  <% } %>
</ul>
<% } %>

<a href="#/collections/new">Create a new collection</a>
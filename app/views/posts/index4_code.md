    <div>
      <%= form_tag(components_path, method: 'get', class: 'flex items-center') do %>
        <%= text_field_tag :search, params[:search], placeholder: 'Search components', class: 'rounded bg-gray-800 text-white px-4 py-2 focus:outline-none focus:shadow-outline' %>
        <%= submit_tag 'Search', class: 'ml-2 bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700 focus:outline-none focus:shadow-outline' %>
      <% end %>

    <div>
      <%= form_tag(components_path, method: 'get', class: 'flex items-center') do %>
        <%= text_field_tag :search, params[:search], placeholder: 'Search components', class: 'rounded bg-gray-800 text-white px-4 py-2 focus:outline-none focus:shadow-outline' %>
        <%= submit_tag 'Search', class: 'ml-2 bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700 focus:outline-none focus:shadow-outline' %>
      <% end %>


# MISC L66
      <%= link_to "Inspect", inspectc_posts_path(post), remote: true, data: { toggle: "modal", target: "#inspectModal", turbo_frame: 'targ' }, class: 'text-blue-500 hover:text-blue-700 ml-2' %>
      L100
            <%# MODAL WITH HTMX%>
      <%= link_to "Inspect", inspectc_posts_path(id: post.id), remote: true, data: { toggle: "modal", target: "#inspectModal" } %>
      L104
            <%= link_to 'Load Pokemon TURBO tf-pokemon-list', inspectc_posts_path, 
              data: { turbo_frame: 'targ' }, 
              class: 'your-other-classes-here' %>

      # SAME BUT TOGETHER
      <%# MODAL WITH HTMX%, turbolinks %>
      <%= link_to "Inspect", inspectc_posts_path(id: post.id), remote: true, data: { toggle: "modal", target: "#inspectModal" } %>
      <%= link_to 'Load Inspectc turbo_frame', inspectc_posts_path(id: post.id),
              data: { turbo_frame: 'targ' }, 
              class: 'your-other-classes-here' %>
      <%= link_to 'Load Pokemon TURBO tf-pokemon-list', inspectc_posts_path, 
              data: { turbo_frame: 'targ' }, 
              class: 'your-other-classes-here' %>

      <%= link_to "Inspect", gunparam_posts_path(post_title: post.title), data: { toggle: "modal", target: "#inspectModal" } %>


# LOWER HALF => RENDER COMPONENTS

<!-- app/views/index.html.erb -->
<%#SHOW postS:INFO%>
<div class="grid grid-cols-1 md:grid-cols-3 gap-4">
  <% @components.each do |component| %>
    <div class="bg-white rounded-lg shadow-md p-6">
      <!-- Your component content goes here -->
      <h2 class="text-lg font-bold mb-2"><%= component.name %></h2>
      <p class="text-gray-600 mb-4"><%= component.lang %></p>
      <%= link_to "Show this component", component, class: 'text-blue-500 hover:text-blue-700' %>
      <%= link_to "Inspect", inspectc_components_path(component), remote: true, data: { toggle: "modal", target: "#inspectModal", turbo_frame: 'targ' }, class: 'text-blue-500 hover:text-blue-700 ml-2' %>
    </div>
  <% end %>
</div>

<!-- Add this modal at the end of your HTML body -->
<div class="modal fade" id="inspectModal" tabindex="-1" role="dialog" aria-labelledby="inspectModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="inspectModalLabel">Inspect Componentz 
        <%# <% if @component_name%> %>
          <%= @abc %> 
  <%#       <% end%> %> </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="inspectModalBody">
        <!-- Content will be dynamically loaded here via AJAX -->
      </div>
    </div>
  </div>
</div>




<div id="components">
  <% @components.each do |component| %>
    <%= render component %>
    <p>
      <%= link_to "Show this component", component %>
      <%# MODAL WITH HTMX%>
      <%= link_to "Inspect", inspectc_components_path(id: component.id), remote: true, data: { toggle: "modal", target: "#inspectModal" } %>
      <%= link_to 'Load Inspectc turbo_frame', inspectc_components_path(id: component.id),
              data: { turbo_frame: 'targ' }, 
              class: 'your-other-classes-here' %>
      <%= link_to 'Load Pokemon TURBO tf-pokemon-list', inspectc_components_path, 
              data: { turbo_frame: 'targ' }, 
              class: 'your-other-classes-here' %>

      <%= link_to "Inspect", gunparam_components_path(component_name: component.name), data: { toggle: "modal", target: "#inspectModal" } %>
    </p>
  <% end %>
</div>

<div id="replaceme"></div>
<div id="color-circles">
  <% @components.each do |component| %>
  AA
    <div class="color-circle" hx-get="/components/<%= component.id %>" hx-swap="innerHTML" hx-target="#replaceme">
      <!-- Display your color circles here -->
      <%= component.name %>
    </div>
  <% end %>
</div>

<div id="selected-color-name">
  <!-- This div will be updated with the selected color's name -->
</div>

<div id="targ">

</div>

<!-- Selected Component Section -->
<div id="selected-component">
  <% if @selected_component.present? %>
    <h2>Selected Component</h2>
    <%= render @selected_component %>
  <% end %>
</div>

<%= link_to "New component", new_component_path %>

<!-- Add this modal at the end of your HTML body -->
<div class="modal fade" id="inspectModal" tabindex="-1" role="dialog" aria-labelledby="inspectModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="inspectModalLabel">Inspect Component Code</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="inspectModalBody">
        <!-- Content will be dynamically loaded here via AJAX -->
      </div>
    </div>
  </div>
</div>





# SELECTED COMPONENT => POST

<!-- Selected post Section -->
<div id="selected-post">
  <% if @selected_post.present? %>
    <h2>Selected post</h2>
    <%= render @selected_post %>
  <% end %>
</div>

<%= link_to "New post", new_post_path %>

<!-- Add this modal at the end of your HTML body -->
<div class="modal fade" id="inspectModal" tabindex="-1" role="dialog" aria-labelledby="inspectModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="inspectModalLabel">Inspect post Code</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="inspectModalBody">
        <!-- Content will be dynamically loaded here via AJAX -->
      </div>
    </div>
  </div>
</div>

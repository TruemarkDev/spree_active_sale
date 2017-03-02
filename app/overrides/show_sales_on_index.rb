Deface::Override.new(
  virtual_path: 'spree/home/index',
  name: 'show_sales_on_index',
  replace: '[data-hook="homepage_products"]',
  text: "<% if @sale_events.present? %>
          <div data-hook='homepage_sales'>
            <%= render partial: 'spree/shared/sale_events', locals: { sale_events: @sale_events } %>
          </div>
        <% else %>
          <% content_for :sidebar do %>
            <div data-hook='homepage_sidebar_navigation'>
              <%= render partial:  'spree/shared/taxonomies' %>
            </div>
          <% end %>

          <div data-hook='homepage_products'>
            <% cache(cache_key_for_products) do %>
              <%= render partial: 'spree/shared/products', locals: { products: @products } %>
            <% end %>
          </div>
        <% end %>"
)
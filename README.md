# Uikit

Installs a basic set of user interface templates for your Rails application.

Most of this code is from http://nobodysofnyc.com.

## Installation

Add this line to your application's Gemfile:

    group :development do
      gem 'uikit'
    end

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uikit

## Usage

After installing the gem you:

   rails g uikit:install

This installs a basic layout with a footer and header. It might be completely
wrong for you. You could use a more basic layout instead. Like this:

    <!DOCTYPE html>
    <html lang="en">
      <head>
        <title><%= yield :title %></title>
        <%= stylesheet_link_tag "application", :media => "all" %>
        <%= yield :stylesheets %>
        <%= javascript_include_tag "application" %>
        <meta charset="utf-8">
        <%= csrf_meta_tags %>
      </head>
      <body class="<%= "#{current_controller}-#{current_action}" %> <%= content_for :classes %>">
        <% flash.each do |type, msg| %>
          <p class="flash <%= type %>"><%= msg %></p>
        <% end %>

        <div id="container">
          <%= yield %>
        </div>
      </body>
      <%= yield :javascripts %>
    </html>

After that you will want to adjust your application.css:

    /*
     *= require_self
     *= require './uikit.css'
     */

You do not want to use `require_tree` to import `uikit.css`. This will inject all
of the styles in path order. Instead, by leveraging the SCSS imports you can
summarize all of the default styles.

When creating a new controller, for instance `PagesController`, you'll want to
create a new stylesheet such as `app/assets/stylesheets/pages.css.scss`. Then add
this file to be compiled into your global stylesheet:

    /*
     *= require_self
     *= require './uikit.css'
     *= require './pages.css'
     */

Within your new stylesheet, you may want to refer to pre-defined style variables
(like colors and fonts). To ensure that the load order is preserved you can
use the `@import` method at the top of the file:

    @import "uikit/fonts.scss";

    /* Each page has the controller and action added as classes on the body element */
    body.pages.home h1 {
      font-family: $sans;
    }

Within your pages you can set content for `:classes` and `:title`:

    <% content_for :title do 'Exciting new feature' end %>
    <% content_for :classes do 'marketing' end %>

This will set the `<title>` tag and add a "marketing" class to the `<body>` tag.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


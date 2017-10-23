# Emojionearea::Rails

Rails gem for EmojiOne Area
https://github.com/mervick/emojionearea

[![Gem Version](https://badge.fury.io/rb/emojionearea-rails.svg)](https://badge.fury.io/rb/emojionearea-rails)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'emojionearea-rails', '~> 1.2.3'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emojionearea-rails

> **Note** : On bundling this gem, `rumoji`, `emoji`, and `gemojione` gems are also bundled as dependencies.     

## Usage

##### 1. `assets/javascripts/application.js` :

```javascript
//= require emojionearea.min
```

##### 2. `assets/javascripts/emojionearea_init.coffee` :

`#message_content` selector is `id` property for your textarea tag.

```coffee
$(document).on 'turbolinks:load', ->
  $("#message_content").emojioneArea
    autoHideFilters: true
    events: keypress: (editor, event) ->
      if event.which is 13 && !event.shiftKey
        $("#message_content").val $('#message_content').data('emojioneArea').getText()
        $('#new_message').submit()
        $('#message_content').data('emojioneArea').setText ""
        event.preventDefault()
      return

```

##### 3. `assets/javascripts/application.js` :

```javascript
//= require emojionearea_init
//= require emojionearea.min
```

##### 4. `assets/stylesheets/application.scss` :

```css
@import 'emojionearea.min';
```

##### 5. Add asset image path to precompile path

`config/initializers/asset.rb` :

```rb
Rails.application.config.assets.precompile += %w( png_64/* )
```

`config/application.rb` :

```rb
config.assets.paths << Gemojione.images_path
config.assets.precompile << "emoji/*.png"
```

Install emoji image library assets:

```sh
$ rake gemojione:install_assets
====================================================================
= emoji image assets install
= Target: /Users/user/src/rails-app/app/assets/images/emoji
= Source: /Users/user/src/emoji/assets
====================================================================
- Creating /Users/user/src/rails-app/app/assets/images/emoji...
- Installing assets...
```

##### 6. `views/messages/_form.html.erb` :

```rb
<%= simple_form_for @message, remote: true do | f | %>
  <%= f.input :content, as: :text, label: false, input_html: { class: 'emojionearea', rows: 5 }  %>
  <%= f.submit class: 'btn btn-outline-primary' %>
<% end %>
```

##### 7. `gemojify` helper method

After bundling this gem, you can use `gemojify` helper method out of box. This is for showing all emoji characters graphically in `show` action view template.

```html
<div class='message'>
  <div class='user'><%= message.user.user_name %> : </div>
  <div class='content'>
    <%=sanitize gemojify( message.content ) %>
  </div>
</div>
```

##### 8. `gemojione_cdn` helper method

After bundling this gem, you can also use `gemojione_cdn` helper method out of box. This is to use Gemojione in order to support all emojiones and upgrade to v3.1 cdn  in `show` action view template.

```html
<div class='message'>
  <div class='user'><%= message.user.user_name %> : </div>
  <div class='content'>
    <%=sanitize gemojione_cdn( message.content ) %>
  </div>
</div>
```


That's it.

## Changelog

* v1.0.0 :
  - `gemojify` helper method add_development_dependency.
* v1.1.0 :
  - Updated `gemojify` helper to link built-in images
  - Added `gemojify_cdn` helper to link cdn images
  - Added `gemojify_wp` helper to link wp images
  - Added `emojify_code` helper to show emoji text characters
* v1.1.1 :
  - fixed image link path error.
  - added instruction to add the following code line in `config/initializers/asset.rb`:
    ```rb
    Rails.application.config.assets.precompile += %w( png_64/* )
    ```
* v1.1.2 :
  - update z-index of picker to 100.
* v1.1.3 :
  - update `gemojify` helper method (removed asset_path)
* v1.2.3 :
  - add `gemojione_cdn` helper method issued by Matias Fernandez


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/emojionearea-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

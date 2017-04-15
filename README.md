# Emojionearea::Rails

Rails gem for EmojiOne Area
https://github.com/mervick/emojionearea

[![Gem Version](https://badge.fury.io/rb/emojionearea-rails.svg)](https://badge.fury.io/rb/emojionearea-rails)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'emojionearea-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emojionearea-rails

## Usage

##### 1. `assets/javascripts/application.js` :

```javascript
//= require emojionearea
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
//= require emojionearea
```

##### 4. `assets/stylesheets/application.scss` :

```css
@import 'emojionearea.min';
```

##### 5. `views/messages/_form.html.erb` :

```rb
<%= simple_form_for @message, remote: true do | f | %>
  <%= f.input :content, as: :text, label: false, input_html: { class: 'emojionearea', rows: 5 }  %>
  <%= f.submit class: 'btn btn-outline-primary' %>
<% end %>
```

That's it.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/emojionearea-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

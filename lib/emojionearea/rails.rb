require "emojionearea/rails/version"
require "emojionearea/rails/railtie" if defined?(Rails)

module Emojionearea
  module Rails
    class Engine < ::Rails::Engine
    end
  end
end

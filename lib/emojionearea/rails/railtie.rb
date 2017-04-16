require 'rails'
require 'emojionearea/rails/helper'

module Emojionearea
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "emojionearea.action_view" do
        ActiveSupport.on_load(:action_view) do
          include Emojionearea::Rails::Helper
        end
      end
    end
  end
end

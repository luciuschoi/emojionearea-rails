require 'rumoji'
require 'emoji'

module Emojionearea
  module Rails
    module Helper
      def gemojify(content)
        text_symbol = Rumoji.encode(content)
        text_symbol.gsub(/:([\w+-]+):/) do |match|
          if emoji = Emoji.find_by_alias($1)
            %(<img alt="#{emoji.raw}" src="https://cdnjs.cloudflare.com/ajax/libs/emojione/2.1.4/assets/png/#{emoji.image_filename.split("/").last}" style="vertical-align:middle" width="16" height="16" />)
          else
            match
          end
        end.html_safe if content.present?
      end
    end
  end
end
require 'rumoji'
require 'emoji'

module Emojionearea
  module Rails
    module Helper
      def gemojify(content)
        text_symbol = Rumoji.encode(content)
        text_symbol.gsub(/:([\w+-]+):/) do |match|
          if emoji = Emoji.find_by_alias($1)
            %(<img alt="#{emoji.raw}" src="assets/png_64/#{emoji.image_filename.split("/").last}" style="vertical-align:middle" width="16" height="16" />)
          else
            match
          end
        end.html_safe if content.present?
      end
      def gemojify_cdn(content)
        text_symbol = Rumoji.encode(content)
        text_symbol.gsub(/:([\w+-]+):/) do |match|
          if emoji = Emoji.find_by_alias($1)
            %(<img alt="#{emoji.raw}" src="https://cdnjs.cloudflare.com/ajax/libs/emojione/2.1.4/assets/png/#{emoji.image_filename.split("/").last}" style="vertical-align:middle" width="16" height="16" />)
          else
            match
          end
        end.html_safe if content.present?
      end
      def gemojify_wp(content)
        text_symbol = Rumoji.encode(content)
        text_symbol.gsub(/:([\w+-]+):/) do |match|
          if emoji = Emoji.find_by_alias($1)
            %(<img alt="#{emoji.raw}" src="http://emojione.com/wp-content/uploads/assets/emojis/#{emoji.image_filename.split("/").last.split(".").first}.svg" style="vertical-align:middle" width="16" height="16" />)
          else
            match
          end
        end.html_safe if content.present?
      end
      def emojify_code(content)
        text_symbol = Rumoji.encode(content) {|emoji| emoji.code } if content.present?
      end
    end
  end
end

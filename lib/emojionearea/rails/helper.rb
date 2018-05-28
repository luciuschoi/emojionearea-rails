require 'rumoji'
require 'emoji'
require 'gemojione'

module Emojionearea
  module Rails
    module Helper
      def gemojify(content)
        text_symbol = Rumoji.encode(content)
        text_symbol.gsub(/:([\w+-]+):/) do |match|
          if emoji = Emoji.find_by_alias($1)
            image_tag("png_64/#{emoji.image_filename.split("/").last}", size:'16x16', style:"vertical-align:middle")
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
      def gemojione_cdn(content)
        Gemojione.replace_unicode_moji_with_images(content).gsub(/<span.*?emojione-([0123456789abcdef]*).*?>.*?<\/span>/, "<img src='https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/\\1.png' class='emojioneemoji'>").html_safe
      end
    end
  end
end
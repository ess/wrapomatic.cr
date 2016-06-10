require "wrapomatic/line/processor/base"

module Wrapomatic
  class Line
    module Processor
      class Primary < Base
        private def processed
          @processed ||= primary_part
        end

        private def primary_part
          text.slice(0..line_break).rstrip
        end

        private def last_leading_whitespace
          [0, text.index(/[^\s]/).to_i - 1].max
        end

        private def line_break
          case breaking_whitespace > last_leading_whitespace
          when true
            [columns, breaking_whitespace].min
          else
            columns
          end
        end

        private def breaking_whitespace
          text.rindex(/(\s|-)/, columns).to_i
        end
      end
    end
  end
end

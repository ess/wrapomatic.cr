require "./base"
require "./primary"

module Wrapomatic
  class Line
    module Processor
      class Remainder < Base
        @primary : String?

        private def processed
          @processed ||= text.gsub(/^#{Regex.escape(primary)}/, "").lstrip
        end

        private def primary
          @primary ||= Primary.new(text, columns).content
        end
      end
    end
  end
end

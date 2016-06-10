module Wrapomatic
  class Line
    module Processor
      class Base
        getter :text, :columns

        def initialize(@text, @columns)
        end

        def content
          processed
        end

        private def processed
          text
        end
      end
    end
  end
end

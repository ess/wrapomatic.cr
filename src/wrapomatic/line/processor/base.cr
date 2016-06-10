module Wrapomatic
  class Line
    module Processor
      class Base
        getter :text, :columns

        @processed : String?

        def initialize(@text : String, @columns : Int32)
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

require "wrapomatic/line/processor/primary"
require "wrapomatic/line/processor/remainder"

module Wrapomatic
  class Line
    module Processor
      def self.process(line)
        columns = line.columns
        indents = line.indents
        text = line.indented

        [Primary.new(text, columns).content] +
          line.class.new(
            Remainder.new(text, columns).content,
            indents,
            columns
          ).wrapped
      end

    end
  end
end

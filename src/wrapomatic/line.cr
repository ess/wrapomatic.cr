require "wrapomatic/line/processor"

module Wrapomatic
  class Line
    INDENTATION = "  "

    getter :original, :indents, :columns

    def initialize(@original, @indents, @columns)
      raise ArgumentError.new("original may not contain newline") if contains_newline?
    end

    def wrapped
      @wrapped ||= indented.length <= columns ? [indented] : Processor.process(self)
    end

    def indented
      "#{INDENTATION * indents}#{original}"
    end

    private def contains_newline?
      original.chars.include?("\n")
    end
  end
end

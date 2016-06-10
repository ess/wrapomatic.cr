require "./line/processor"

module Wrapomatic
  class Line
    INDENTATION = "  "


    getter :original, :indents, :columns

    def initialize(@original = String.new, @indents = 0, @columns = 80)
      raise ArgumentError.new("original may not contain newline") if contains_newline?
      @wrapped = [] of String
    end

    def wrapped
      return @wrapped unless @wrapped.empty?
      @wrapped = indented.size <= columns ? [indented] : Processor.process(self)
    end

    def indented
      "#{INDENTATION * indents}#{original}"
    end

    private def contains_newline?
      original.chars.includes?("\n")
    end
  end
end

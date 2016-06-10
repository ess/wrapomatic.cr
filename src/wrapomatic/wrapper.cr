require "wrapomatic/line"

module Wrapomatic
  class Wrapper
    getter :text, :lines, :indents, :columns

    def initialize(text, indents = 0, columns = 80)
      @text, @indents, @columns = text, indents, columns
      @lines = [] of String
      spit_some_mad_fire
    end

    def wrapped
      lines.join("\n")
    end

    private def spit_some_mad_fire
      @lines = unwrapped_lines.map {|line|
        Line.new(line, indents, columns).wrapped
      }.flatten
    end

    private def unwrapped_lines
      text.split("\n")
    end
  end
end

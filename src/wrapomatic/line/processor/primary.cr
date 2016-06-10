require "./base"

module Wrapomatic
  class Line
    module Processor
      class Primary < Base
        private def processed
          @processed ||= primary_part
        end

        private def primary_part
          text[0..line_break].rstrip
        end

        private def last_leading_whitespace
          [0, (text.scan(/[^\s]/).first.begin || 0) - 1].max
        end

        private def first_non_whitespace
          result = text.scan(/[^\s]/)
          return 0 if result.empty?
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
          prospects = text.scan(/(\s|-)/).map {|match| match.begin.not_nil!}

          return columns  if prospects.empty?

          candidates = prospects.select {|index| index <= columns}

          return columns if candidates.empty?
          candidates.last
        end
      end
    end
  end
end

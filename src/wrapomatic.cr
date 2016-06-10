require "./wrapomatic/*"

module Wrapomatic
  def self.wrap(text : String, indents = 0, columns = 80) : String
    #indents = options[:indents]? || 0
    #columns = options[:columns]? || 80
    Wrapper.new(text, indents, columns).wrapped
  end
end

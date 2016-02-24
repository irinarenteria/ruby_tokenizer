require "ruby_tokenizer/version"
require "patterns_module/patterns"

module RubyTokenizer

  class Tokenizer
    include Patterns
    attr_accessor :text

    def initialize(text)
      @text = text
    end

    def filter
      text.downcase.gsub(Patterns.basic, '')
    end

    def tokenize
      self.filter.scan(/[-\w'’]+/)
    end
  end
end

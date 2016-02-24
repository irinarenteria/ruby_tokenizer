require "ruby_tokenizer/version"
require "patterns_module/patterns"

module RubyTokenizer

  class Tokenizer
    include Patterns
    attr_accessor :text
    attr_reader :count

    def initialize(text)
      @text = text
      @count = Hash.new(0)
    end

    def filter
      text.downcase.gsub(Patterns.basic, '')
    end

    def tokenize
      self.filter.scan(/[-\w'’]+/)
    end

    def frequency
    end

  end
end

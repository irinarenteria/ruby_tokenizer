require "ruby_tokenizer/version"
require "patterns_module/patterns"

module RubyTokenizer

  class Tokenizer
    include Patterns
    attr_reader :text

    def initialize(text)
      @text = text
    end

    def filter(text)
    end
  end
end

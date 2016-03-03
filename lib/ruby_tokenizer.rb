require "ruby_tokenizer/version"
require "patterns_module/patterns"

module RubyTokenizer

  class Tokenizer
    include Patterns
    attr_reader :text

    def initialize(text)
      @text = text
    end

    def rank
      ranked = Hash[self.frequency.sort_by { |_word, count| count }.reverse]
      ranked.first(10)
    end

    protected
    
    def filter
      text.downcase.gsub(Patterns.basic, ' ')
    end

    def tokenize
      self.filter.scan(/[-\w'’.@]+/).map { |token| token.gsub(/[._-]$/, '') }
    end

    def frequency
      count = Hash.new(0)
      parsed = self.tokenize
      parsed.each { |word| count[word] += 1 }

      return count
    end
  end
end

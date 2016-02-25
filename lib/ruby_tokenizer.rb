require "ruby_tokenizer/version"
require "patterns_module/patterns"
require 'pry'

module RubyTokenizer

  class Tokenizer
    include Patterns
    attr_reader :text, :count

    def initialize(text)
      @text = text
      @count = Hash.new(0)
    end

    def rank
      ranked = Hash[self.frequency.sort_by {|_word, count| count}.reverse]
      ranked.first(10)
    end

    protected
    
    def filter
      text.downcase.gsub(Patterns.basic, '')
    end

    def frequency
      parsed = self.tokenize
      parsed.each { |word| count[word] += 1}
      return count
    end
    
    def tokenize
      self.filter.scan(/[-\w'’]+/)
    end
  end
end

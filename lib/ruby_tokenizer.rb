require "ruby_tokenizer/version"
require "patterns_module/patterns"
require 'pry'

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
      parsed = self.tokenize
      parsed.each { |word| count[word] += 1}
      return count
    end

    def rank
      ranked = Hash[self.frequency.sort_by {|word, count| count}.reverse]
      ranked.first(10)
    end
  end
end

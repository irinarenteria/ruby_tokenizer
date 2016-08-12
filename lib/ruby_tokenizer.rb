require "ruby_tokenizer/version"
require 'format/output'

module RubyTokenizer

=begin
This class' protected interface selects viable tokens by processesing string inputs
through chosen level of tokenization and post-processing special characters.
The public interface outputs the top 10 tokens by frequency.

Initially, when the class was smaller, it made sense to keep the main logic here,
but now it has mutiple responsibilities, so there's a need for a TokenCount and
a TokenizerOutput class.
=end

  class Tokenizer
    attr_reader :text, :level, :flag

    def initialize(text, level, *flag)
      @text = text
      @level = level
      @flag = flag
    end

    def rank
      ranked = Hash[self.frequency.sort.sort_by { |word| word[1] }.reverse]
      word_count = ranked.first(10)
      if self.flag.empty?
        return word_count
      else
        new_output = Format(word_count)
        return new_output.output_to_csv
      end
    end

    protected

    def filter
      text.downcase.gsub(level, ' ')
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

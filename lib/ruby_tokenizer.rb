require "ruby_tokenizer/version"

module RubyTokenizer

  class Tokenizer
  	attr_reader :text

  	def initialize(text)
  		@text = text
  	end

  end

end

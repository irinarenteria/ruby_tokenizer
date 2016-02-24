require 'spec_helper'
require 'ruby_tokenizer'

describe RubyTokenizer do
	let(:token) {RubyTokenizer::Tokenizer.new('Searching records is a common requirement in web applications.')}

	describe "#version" do	
		it 'has a version number' do
			expect(RubyTokenizer::VERSION).not_to be nil
  		end
	end

  	describe "#new" do
		it "takes one parameter and returns a Tokenizer object" do
			expect(token).to be_an_instance_of RubyTokenizer::Tokenizer
		end

		it "contains a String" do
			expect(token.text).to be == 'Searching records is a common requirement in web applications.'
		end
	end

  describe "#filter" do
    it "returns a String" do
      expect(token.filter).to be_a_kind_of String
    end

    it "filters tokens" do
      expect(token.filter).to be == 'searching records is a common requirement in web applications'
    end
  end
end

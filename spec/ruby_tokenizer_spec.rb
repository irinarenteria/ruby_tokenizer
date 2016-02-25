require 'spec_helper'
require 'ruby_tokenizer'

describe RubyTokenizer do
	let(:token) {RubyTokenizer::Tokenizer.new('Searching records is a common requirement in web applications.')}
  RubyTokenizer::Tokenizer.send(:public, *RubyTokenizer::Tokenizer.protected_instance_methods) 

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

  describe "#tokenize" do
    it "should be an Array" do
      expect(token.tokenize).to be_a_kind_of Array
    end

    it "parses string into tokens" do
      expect(token.tokenize).to be == ["searching", "records", "is", "a", "common", "requirement", "in", "web", "applications"]
    end
  end

  describe "#frequency" do
    it "should be a Hash" do
      expect(token.frequency).to be_a_kind_of Hash
    end

    it "contains a hash" do
      expect(token.frequency).to be == {"searching"=>1, "records"=>1, "is"=>1, "a"=>1, "common"=>1, "requirement"=>1, "in"=>1, "web"=>1, "applications"=>1}
    end
  end

  describe "#rank" do
    it "should be an Array" do
      expect(token.rank).to be_a_kind_of Array
    end

    it "contains a nested array" do
      expect(token.rank).to be == [["applications", 1], ["web", 1], ["in", 1], ["requirement", 1], ["common", 1], ["a", 1], ["is", 1], ["records", 1], ["searching", 1]]
    end
  end
end

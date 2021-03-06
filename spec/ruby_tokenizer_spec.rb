require 'spec_helper'
require 'ruby_tokenizer'
require "patterns/patterns"

describe RubyTokenizer do
  let(:token) { RubyTokenizer::Tokenizer.new('Searching records is a common requirement in web applications.', Patterns.basic) }
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

    it "downcases the string and removes leading and trailing whitespaces" do
      expect(token.filter).to be == 'searching records is a common requirement in web applications.'
    end

    it "should remove matching patterns" do
      expect(token.filter).not_to match(Patterns.basic)
    end
  end

  describe "#tokenize" do
    let(:apostrophe) { RubyTokenizer::Tokenizer.new("isn't sayin' Mike’s Thompsons’", Patterns.basic) }
    let(:underscore) { RubyTokenizer::Tokenizer.new("green_mill jazz", Patterns.basic) }
    let(:hyphen) { RubyTokenizer::Tokenizer.new("green-mill jazz", Patterns.basic) }
    let(:acronym) { RubyTokenizer::Tokenizer.new("U.S.A.", Patterns.basic) }
    let(:email) { RubyTokenizer::Tokenizer.new("genghis.khan@gmail.com, leslie_knope@yahoo.com", Patterns.basic) }
    let(:url) { RubyTokenizer::Tokenizer.new("www.robots.com", Patterns.basic) }
    let(:end_hyphen) { RubyTokenizer::Tokenizer.new("doctor who-", Patterns.basic) }
    let(:end_underscore) { RubyTokenizer::Tokenizer.new("doctor who_", Patterns.basic) }

    it "should be an Array" do
      expect(token.tokenize).to be_a_kind_of Array
    end

    it "parses string into tokens" do
      expect(token.tokenize).to be == ["searching", "records", "is", "a", "common", "requirement", "in", "web", "applications"]
    end

    it "preserves apostrophes within or at the end of words" do
      expect(apostrophe.tokenize).to be == ["isn't", "sayin'", "mike’s", "thompsons’" ]
    end

    it "preserves underscores" do
      expect(underscore.tokenize).to be == ["green_mill", "jazz"]
    end

    it "preserves hyphens" do
      expect(hyphen.tokenize).to be == ["green-mill", "jazz"]
    end

    it "preserves acronyms and initialisms with periods" do
      expect(acronym.tokenize).to be == ["u.s.a"]
    end

    it "preserves e-mail addresses" do
      expect(email.tokenize).to be == ["genghis.khan@gmail.com", "leslie_knope@yahoo.com"]
    end

    it "preserves URLs" do
      expect(url.tokenize).to be == ["www.robots.com"]
    end

    it "clears end of string hyphens" do
      expect(end_hyphen.tokenize).to be == ["doctor", "who"]
    end

    it "clears end of string underscores" do
      expect(end_underscore.tokenize).to be == ["doctor", "who"]
    end
  end

  describe "#frequency" do
    it "should be a Hash" do
      expect(token.frequency).to be_a_kind_of Hash
    end

    it "contains word counts" do
      expect(token.frequency).to be == {"searching"=>1, "records"=>1, "is"=>1, "a"=>1, "common"=>1, "requirement"=>1, "in"=>1, "web"=>1, "applications"=>1}
    end
  end

  describe "#rank" do
    let(:sample) { RubyTokenizer::Tokenizer.new('Searching searching searching is is a common requirement in web applications.', Patterns.basic) }
    it "should be an Array" do
      expect(sample.rank).to be_a_kind_of Array
    end

    it "contains a nested array" do
      expect(sample.rank).to be == [["searching", 3], ["is", 2], ["web", 1], ["requirement", 1], ["in", 1], ["common", 1], ["applications", 1], ["a", 1]]
    end
  end
end

require 'spec_helper'
require 'patterns_module/patterns'

describe Patterns do

  describe "constants" do
    it "contains patterns as constants" do
      expect(Patterns::PUNCTUATION).to eq([':', ',', '—', '!', '?', ';', '"'])
    end
  end

  describe "#basic" do
    it "should return a Regexp object" do
      expect(Patterns.basic).to be_a_kind_of Regexp
    end
  end
end
require 'spec_helper'
require 'patterns/patterns'

describe Patterns do

  describe "constants" do
    it "contains punctuation as a constant" do
      expect(Patterns::PUNCTUATION).to eq([':', ',', '—', '!', '?', ';', '"'])
    end

    it "contains parens as a constant" do
      expect(Patterns::PARENS).to eq(['{', '[', '}', ']', '(', ')'])
    end

    it "contains misc. characters as a constant" do
      expect(Patterns::MISC).to eq(['<', '«', '„', '>', '»', '“', '*'])
    end

    it "contains a low-level tokenizing pattern" do
      expect(Patterns::BASIC).to eq(Patterns::PUNCTUATION + Patterns::PARENS + Patterns::MISC)
    end
  end

  describe "#basic" do
    it "should return a Regexp object" do
      expect(Patterns.basic).to be_a_kind_of Regexp
    end
  end
end

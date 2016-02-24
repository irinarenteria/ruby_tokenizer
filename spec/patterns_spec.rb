require 'spec_helper'
require 'patterns_module/patterns'

describe Patterns do

  context "#basic" do
    it "should return a Regexp object" do
      expect(Patterns.basic). to be_a_kind_of Regexp
    end
  end
  
end
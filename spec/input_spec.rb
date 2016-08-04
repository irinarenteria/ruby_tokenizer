require 'spec_helper'
require 'input/input'

describe InputStream do

  describe ".prompt" do
    let(:string_output) { InputStream.prompt("--- Please input your text below ----") }

    it "takes a string as a parameter and outputs to STDOUT" do
      expect { string_output }.to output("--- Please input your text below ----\n").to_stdout
    end
  end

  describe ".get_input" do
    it "captures STDIN and outputs it as a string" do
      mod_double = class_double("InputStream").as_stubbed_const(:transfer_nested_constants => true)

      allow(mod_double).to receive(:get_input)
      expect { mod_double.get_input }.to output(kind_of(String)).to_stdout
    end
  end
end

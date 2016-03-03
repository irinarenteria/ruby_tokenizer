require 'spec_helper'
require 'input_stream_module/input_stream'

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

  describe ".read_file" do
    let(:file) { InputStream.read_file(['no.txt']) }
    let(:content) { 'This is a test.' }
    let(:test_file) { Tempfile.new("test") }

    it "raises an error when the file can't be found or read" do
      expect { file }.to raise_error(LoadError, "File not found: Please try again.")
    end

    it "reads input files" do
    mod_double = class_double("InputStream").as_stubbed_const(:transfer_nested_constants => true)
    allow(mod_double).to receive(:read_file).with(kind_of(Array))

    test_file.write(content)
    test_file.rewind

    expect { mod_double.read_file([test_file.path]) }.to output(kind_of(String)).to_stdout

    test_file.close
    test_file.unlink
    end
  end
end
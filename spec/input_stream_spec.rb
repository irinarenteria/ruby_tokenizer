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
    pending
  end

  describe ".read_file" do
    pending
  end

end
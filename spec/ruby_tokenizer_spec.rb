require 'spec_helper'

require 'ruby_tokenizer'

describe RubyTokenizer do
	let(:token) {RubyTokenizer.new('Searching records is a common requirement in web applications.')}
  
  it 'has a version number' do
    expect(RubyTokenizer::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end

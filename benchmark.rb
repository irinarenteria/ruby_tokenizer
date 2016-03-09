require 'benchmark'
require 'input_stream_module/input_stream'
require 'ruby_tokenizer'
require "patterns_module/patterns"

test = RubyTokenizer::Tokenizer.new("green-mill jazz")

puts Benchmark.measure { test.rank }
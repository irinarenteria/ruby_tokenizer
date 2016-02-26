$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ruby_tokenizer'

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

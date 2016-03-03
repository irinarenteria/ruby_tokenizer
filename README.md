# RubyTokenizer

[![Code Climate](https://codeclimate.com/github/irinarenteria/ruby_tokenizer/badges/gpa.svg)](https://codeclimate.com/github/irinarenteria/ruby_tokenizer)
[![Build Status](https://travis-ci.org/irinarenteria/ruby_tokenizer.svg?branch=master)](https://travis-ci.org/irinarenteria/ruby_tokenizer)
[![Test Coverage](https://codeclimate.com/github/irinarenteria/ruby_tokenizer/badges/coverage.svg)](https://codeclimate.com/github/irinarenteria/ruby_tokenizer/coverage)
[![Gemnasium](https://img.shields.io/gemnasium/mathiasbynens/he.svg)](https://github.com/irinarenteria/ruby_tokenizer)
[![Gem Version](https://badge.fury.io/rb/ruby_tokenizer.svg)](https://badge.fury.io/rb/ruby_tokenizer)

RubyTokenizer is a simple language processing command-line tool, modeled after Apache Solr's [Classic Tokenizer](https://cwiki.apache.org/confluence/display/solr/Tokenizers). It performs low-level tokenization through word-segmentation by filtering whitespaces, punctuation marks, parantheses and other special characters, and returns the top 10 most frequent words in a body of text. At the moment it's only available for English texts in UTF-8 (Unicode 6.3) format, e.g. standard Gutenberg.org files. All results are case-insensitive.

## Installation

To use this tool, you need to have Ruby installed. You can find more detailed instructions here: http://www.ruby-lang.org/en/downloads/ 

Add this line to your application's Gemfile:

```ruby
gem 'ruby_tokenizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_tokenizer

## Usage

To tokenize a text, enter the command "tokenizer" followed by the paths to the targeted file(s):
	
```ruby
$ tokenizer /file1/path/here.txt /file2/path/here.txt
```
If you are in the folder containing the targeted text files:

```ruby
$ tokenizer file1.txt file2.text
```

This is the expected output:

```ruby
$ [["the", 1782],
  ["and", 855],
  ["to", 790],
  ["a", 672],
  ["of", 610],
  ["she", 533],
  ["it", 463],
  ["said", 457],
  ["in", 416],
  ["alice", 384]]
```

If only the 'tokenizer' command is entered, then the user will be prompted to enter a string:
```ruby
$ tokenizer
$ "--- Please input your text below ----"
$ 
```

If the file path cannot be found or the file has a format that cannot be read, a LoadError will be displayed:
```ruby
$ `read_file': File not found: Please try again. (LoadError)
```

## Special Cases

RubyTokenizer accounts for e-mail addresses, URLs, hyphenated words and certain abbreviations as follows:

Email addresses:
```ruby
$ ["leslie.knope@gmail.com"]
$ ["leslie_knope@gmail.com"]
$ ["leslie-knope@gmail.com"]
```
URLs:
```ruby
$ ["www.frankestein.com"]
```
Hyphenated words:
```ruby
$ ["Chicago-based"]
```
Abbreviations:
```ruby
$ ["U.S.A"]
```
Numbers (phone numbers and numbers with a comma format are not tokenized):
```ruby
$ ["3.50"]
```

## Development

To run the test suite, fork the repo, clone it to a local directory and in the root directory run the following command:

```ruby
$ bundle exec rspec
```
The following dependencies are required:
[Bundler](https://github.com/bundler/bundler)
[Rake](https://github.com/ruby/rake)
[RSpec](https://github.com/rspec/rspec)
[Pry](https://github.com/pry/pry)

To install these dependencies manually:
```ruby
$ gem install name
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/irinarenteria/ruby_tokenizer.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


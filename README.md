# RubyTokenizer

[![Code Climate](https://codeclimate.com/repos/56ce511eacac410093009b23/badges/001a637ad10c8f8159e7/gpa.svg)](https://codeclimate.com/repos/56ce511eacac410093009b23/feed)
[![Travis](https://img.shields.io/travis/rust-lang/rust.svg)](https://github.com/irinarenteria/ruby_tokenizer)
[![Test Coverage](https://codeclimate.com/repos/56ce511eacac410093009b23/badges/001a637ad10c8f8159e7/coverage.svg)](https://codeclimate.com/repos/56ce511eacac410093009b23/coverage)
[![Gemnasium](https://img.shields.io/gemnasium/mathiasbynens/he.svg)](https://github.com/irinarenteria/ruby_tokenizer)
[![Gem Version](https://badge.fury.io/rb/ruby_tokenizer.svg)](https://badge.fury.io/rb/ruby_tokenizer)

RubyTokenizer is a simple language processing command-line tool. It performs low-level tokenization and returns the top 10 most frequent words in a body of text. At the moment it's only available for English texts and it segments words by filtering whitespaces, punctuation marks, parantheses and other special characters.

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

## Development

To run the test suite, fork the repo, clone it to a local directory and in the root directory run the following command:

```ruby
$ bundle exec rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/irinarenteria/ruby_tokenizer.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


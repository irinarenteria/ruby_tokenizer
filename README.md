# RubyTokenizer

[![Code Climate](https://img.shields.io/codeclimate/github/kabisaict/flow.svg)](https://github.com/irinarenteria/ruby_tokenizer)
[![Code Climate](https://img.shields.io/codeclimate/coverage/github/triAGENS/ashikawa-core.svg)](https://github.com/irinarenteria/ruby_tokenizer)
[![Gemnasium](https://img.shields.io/gemnasium/mathiasbynens/he.svg)](https://github.com/irinarenteria/ruby_tokenizer)

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

To tokenize a text, enter the command "tokenizer" followed by the paths to the targeted files.
	
```ruby
$ tokenizer /file1/path/here.txt /file2/path/here.txt
```

This is the expected output:

```ruby
$ ["i", 2817],
  ["of", 2720],
  ["to", 2126],
  ["my", 1761],
  ["a", 1375],
  ["in", 1156],
  ["me", 856],
  ["with", 704],
  ["had", 686],
  ["you", 637]]
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


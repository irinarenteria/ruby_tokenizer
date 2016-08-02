module Patterns

=begin
This module is meant to provide Regex customization options for the Tokenizer class.
Levels of tokenization can be created through the use of pre-defined patterns.
=end

  PUNCTUATION = [':', ',', '—', '!', '?', ';', '"']
  PARENS = ['{', '[', '}', ']', '(', ')']
  MISC = ['<', '«', '„', '>', '»', '“', '*']

  BASIC = PUNCTUATION + PARENS + MISC

  def self.basic
    Regexp.union(BASIC)
  end
end

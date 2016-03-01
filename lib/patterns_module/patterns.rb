module Patterns
  PUNCTUATION = [':', ',', '—', '!', '?', ';', '"']
  PARENS = ['{', '[', '}', ']', '(', ')']
  MISC = ['<', '«', '„', '>', '»', '“', '*']
  # CONJUNCTIONS = ['for ', 'and ', 'nor ', 'but ', 'or ', 'yet ', 'so ', 'as ']
  # DETERMINERS = ['the ', 'this ', 'that ']

  BASIC = PUNCTUATION + MISC

  def self.basic
    Regexp.union(BASIC)
  end
end

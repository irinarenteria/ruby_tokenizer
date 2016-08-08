require 'csv'

class Format
  attr_reader :word_count

  def initialize(word_count)
    @word_count = word_count
  end

  def output_to_csv
    CSV.open('word_count.csv', 'wb') do |row|
      row << ['word', 'count']
      self.word_count.each { |word, count| row << [word, count]}
    end
    puts "--- CSV has been created ----"
  end
end

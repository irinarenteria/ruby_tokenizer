module InputStream

  def self.analyze
    if ARGV.empty?
      puts "--- Please input your text below ----"
      text = STDIN.gets
    elsif ARGV.detect { |input| File.file?(input) == false }
      puts "File not found: Please try again."
      exit 2
    else
      text = ARGF.read
    end
  end

end
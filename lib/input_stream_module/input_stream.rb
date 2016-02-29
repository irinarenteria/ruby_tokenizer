module InputStream

  def self.analyze(input)
    if input.empty?
      puts "--- Please input your text below ----"
      text = STDIN.gets
    elsif input.detect { |path| File.file?(path) == false }
      puts "File not found: Please try again."
      exit 2
    else
      text = ARGF.read
    end
  end
end
module InputStream

=begin
The methods in this module parse all command-line arguments according to 4 scenarios:
  1) An empty input will prompt the user to enter a custom string
  2) Single file input will output the text
  3) Multiple file input will concatenate and output the text
  4) Invalid file path/format will raise an error and stop the program

Further steps: Separate file processing responsibilities into a FileProcessor class,
which would also include a method for encoding the input to UTF-8.
=end

  def self.analyze(input)
    if input.empty?
      self.prompt("--- Please input your text below ----")
      self.get_input
    else
      self.read_file(input)
    end
  end

  def self.prompt(string)
    puts string
  end

  def self.get_input
    STDIN.gets
  end

  def self.read_file(input)
    if input.detect { |path| File.file?(path) == false }
      raise LoadError, "File not found: Please try again."
      exit 2
    else
      ARGF.read
    end
  end
end
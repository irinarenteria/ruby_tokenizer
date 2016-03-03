module InputStream

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
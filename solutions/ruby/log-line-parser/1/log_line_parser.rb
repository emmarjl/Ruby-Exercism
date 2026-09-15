class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.split(':', 2).last.strip
  end

  def log_level
    start = @line.index('[') + 1
    finish = @line.index(']')
    @line[start...finish].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end

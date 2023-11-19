class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @message ||= @line.split(':')[1].strip
  end

  def log_level
    @log_level ||= @line.split(':')[0].gsub(/[\[\]]/, '').downcase
  end

  def reformat
    @message || message
    @log_level || log_level
    @reformat ||= "#{@message} (#{log_level})"
  end
end

class LogLineParser
  attr_accessor :message, :log_level, :reformat

  def initialize(line)
    @log_level = line.split(':')[0].gsub(/[\[\]]/, '').downcase
    @message = line.split(':')[1].strip
    @reformat = "#{@message} (#{log_level})"
  end
end

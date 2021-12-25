class Version
  attr_reader :current_version
  def initialize
    @current_version = '0.1.0'
  end
end

ver = Version.new
puts "Current version #{ver.current_version}"

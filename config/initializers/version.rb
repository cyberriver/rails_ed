class Version
  attr_reader :current_version
  def self.current_version
    @current_version = '0.1.0'
  end
end

puts "Current version #{Version.current_version}"

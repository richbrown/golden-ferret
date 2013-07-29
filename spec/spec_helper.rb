# encoding: utf-8

puts "golden ferret specs: Running on Ruby Version: #{RUBY_VERSION}"

#require the lib directory
Dir[File.dirname(__FILE__) + "/../lib/**/*.*"].each do |file|
	next if file == '.' or file == '..'
	require file
end

require "bundler"
Bundler.setup

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/extensions/ and its subdirectories.
Dir[File.dirname(__FILE__) + "/extensions/**/*.rb"].each {|f| require f }

# RSpec.configure do |config|
#   config.mock_framework = :mocha
#   config.include EncodingHelpers
# end

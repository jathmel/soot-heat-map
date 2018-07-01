ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.

# ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
#
# require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

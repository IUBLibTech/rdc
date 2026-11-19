ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# Unset ENV HOST unless different from HOSTNAME. Some OSes set HOST to hostname.
# Rails uses HOST to set bind address, preventing puma from serving SSL via `rails s`.
ENV.delete('HOST') if ENV['HOST'] == ENV['HOSTNAME']

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.

# Rakefile
#
#
# DESCRIPTION:
#   Create a rake environment for working with the sensu plugins
#
# OUTPUT:
#   N/A
#
# PLATFORMS:
#   all
#
# DEPENDENCIES:
#   gem: github-api
#
# USAGE:
#   ./repo-init.rb <gem name> <user name>
#
# NOTES:
#
# LICENSE:
#   Copyright 2015 Yieldbot, Inc  <devops@yieldbot.com>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'benchmark'
require 'github_api'

# Load our rake configuration
require File.expand_path('../GIR/config/rake', __FILE__)

# Load our helper files
Dir[File.join(File.dirname(__FILE__), 'GIR', 'tasks', 'helpers', '*.rb')].sort.each do |f|
  require f
end

# Load our tasks
Dir[File.join(File.dirname(__FILE__), 'GIR', 'tasks', '*.rake')].sort.each do |f|
  load f
end

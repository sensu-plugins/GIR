#! /usr/bin/env ruby
#
# rake
#
#
# DESCRIPTION:
#   configuration information for thr rake tasks
#
# OUTPUT:
#   N/A
#
# PLATFORMS:
#   all
#
# DEPENDENCIES:
#
# USAGE:
#
# NOTES:
#
# LICENSE:
#   Copyright 2015 Yieldbot, Inc  <devops@yieldbot.com>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

# Rake Configuration File
# Disable echoing of sh commands (sh command output will still be displayed)
RakeFileUtils.verbose_flag = false

# The top of the repository checkout
TOPDIR = File.expand_path(File.join(File.dirname(__FILE__), '..'))
PROJECT_DIR = File.expand_path(File.join(File.dirname(__FILE__), '../..'))

# Store your github token with the proper permissions in a file, this should
# allow you to avoid having to worry about hardcoding it or forgeting it
#
def acquire_git_token
  File.readlines(File.expand_path('~/.ssh/git_token')).each do |line|
    return line
  end
end

# Gem Specifications
REQUIRED_RUBY_VERSION  = '1.9.3'
GEM_AUTHOR             = ['Yieldbot, Inc. and contributors']
GEM_EMAIL              = '<sensu-users@googlegroups.com>'
GEM_LICENSE            = 'MIT'
GEM_REQUIRE_PATHS      = ['lib']
GEM_CERT_CHAIN         = ['certs/sensu-plugins.pem']
GEM_PLATFORM           = Gem::Platform::RUBY
DEV_DEPENDENCIES       = [{ name: 'codeclimate-test-reporter', version: 'XXX' },
                          { name: 'rubocop',                   version: '~> 0.17.0' },
                          { name: 'rspec',                     version: '~> 3.1' },
                          { name: 'bundler',                   version: '~> 1.7' },
                          { name: 'rake',                      version: '~> 10.0' },
                          { name: 'github-markup',             version: 'XXX' },
                          { name: 'redcarpet',                 version: 'XXX' },
                          { name: 'yard',                      version: 'XXX' },
                          { name: 'pry',                       version: 'XXX' }]

# Repo Boilerplater  Variables
LICENSE_EMAIL = 'devops@yieldbot.com'
GEM_INITIAL_VERSION = '0.0.1.alpha.1'
# Github Configurations
# GITHUB_ORG                   = 'CaffeinatedEngineering'
GITHUB_ORG                   = 'sensu-plugins'
SENSU_PLUGINS_HOMEPAGE       = 'http://sensu-plugins.github.io'
GITHUB_TOKEN                 = acquire_git_token
GITHUB_INITIAL_MILESTONE     = 'v0.0.1'
TEAM_ID                      = 1_253_454
PRIVATE_REPO                 = false
GITHUB_ISSUES                = true
GITHUB_WIKI                  = false
GITHUB_AUTO_INIT             = false
GITHUB_REPO_DOWNLOADS        = true

# these labels are used by waffle.io for sorting issues into columns
STD_PLUGIN_LABELS            = [{ name: 'Investigation Required', color: '5319e7' },
                                { name: 'In Progress', color: 'fad8c7' },
                                { name: 'Community Feedback Requested', color: 'fbca04' },
                                { name: 'Developer Feedback Requested', color: 'c7def8' },
                                { name: 'Refactor', color: '005200' },
                                { name: 'Bug', color: 'fc2929' },
                                { name: 'Enhancement', color: '84b6eb' }]
                                # { name: 'Help Wanted', color: '159818' }]

# these labels are ones we don't push to waffle.io
GITHUB_REMOVABLE_STD_LABELS  = ['duplicate', 'invalid', 'wontfix', 'question', 'enhancement', 'bug']

# Path settings for rake tasks
@plugin_name     = ENV['plugin'] || nil
TEMPLATE_DIR     = File.join(TOPDIR, 'files/templates')
STATIC_DIR       = File.join(TOPDIR, 'files/static')
PLUGINS_DIR      = File.join(PROJECT_DIR, 'sensu-plugins-')
GEM_TEMPLATE_DIR = File.join(TEMPLATE_DIR, 'gem')
GEM_STATIC_DIR   = File.join(STATIC_DIR, 'gem')
@gem_root        = "sensu-plugins-#{ ENV['plugin']}" || nil
@plugin_dir      = @plugin_name.nil? ? nil : PLUGINS_DIR << @plugin_name

PLUGIN_CLONE_ADDRESS = "git@github.com:sensu-plugins/sensu-plugins-#{ @plugin_name }.git"

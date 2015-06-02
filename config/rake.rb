# Disable echoing of sh commands (sh command output will still be displayed)
RakeFileUtils.verbose_flag = false

TOPDIR = File.expand_path(File.join(File.dirname(__FILE__), '..'))
PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../..'))

# Store your github token with the proper permissions in a file, this should
# allow you to avoid having to worry about hardcoding it or forgeting it
#
def acquire_git_token
  File.readlines(File.expand_path('~/.ssh/git_token')).each do |line|
    return line
  end
end

#######################################
#                                     #
# Path Settings                       #
#                                     #
#######################################

# Static locations
TEMPLATE_DIR     = File.join(TOPDIR, 'files/templates')
STATIC_DIR       = File.join(TOPDIR, 'files/static')
PLUGINS_DIR      = File.join(PROJECT_ROOT, 'sensu-plugins-')
GEM_TEMPLATE_DIR = File.join(TEMPLATE_DIR, 'gem')
GEM_STATIC_DIR   = File.join(STATIC_DIR, 'gem')

# User generated locations
@plugin_name     = ENV['plugin'] || nil
@gem_root        = "sensu-plugins-#{ ENV['plugin']}" || nil
@plugin_dir      = @plugin_name.nil? ? nil : PLUGINS_DIR << @plugin_name
@gem_class       = @gem_root.split('-').map(&:capitalize).join

#######################################
#                                     #
# Plugin Repo Boilerplate Variables   #
#                                     #
#######################################

# CHANGELOG.md.erb
GEM_INITIAL_VERSION = '0.0.1.alpha.1'

# CONTRIBUTING.md.erb
DEVELOPMENT_SITE = 'http://sensu-plugins.github.io/development/'

# LICENSE.erb
LICENSE_EMAIL = 'sensu-plugin@sensu-plugins.io'
LICENSE_USER = 'Sensu Plugins'

# Rakefile.erb
RAKEFILE_REQUIREMENTS = ['bundler/gem_tasks', 'rspec/core/rake_task', 'yard',
                         'github/markup', 'rubocop/rake_task', 'redcarpet',
                         'yard/rake/yardoc_task']

# rubocop.yml.erb
COPS = [{ name: 'MethodLength', value: 'Max: 200' },
        { name: 'LineLength', value: 'Max: 160' },
        { name: 'FileName', value: 'Enabled: false' },
        { name: 'PerceivedComplexity', value: 'Enabled: false' },
        { name: 'CyclomaticComplexity', value: 'Enabled: false' },
        { name: 'ClassLength', value: 'Enabled: false' },
        { name: 'IfUnlessModifier', value: 'Enabled: false' },
        { name: 'RegexpLiteral', value: 'Enabled: false' },
        { name: 'AbcSize', value: 'Max: 75' },
        { name: 'Documentation', value: 'Enabled: false' }]

# Gem version module

# Gemspec
GEMSPEC_REQUIREMENTS   = ['date']
PVT_KEY                = '~/.ssh/gem-private_key.pem'
REQUIRED_RUBY_VERSION  = '>= 1.9.3'
GEM_AUTHOR             = ['Sensu Plugins and contributors']
GEM_EMAIL              = '<sensu-users@googlegroups.com>'
GEM_LICENSE            = 'MIT'
GEM_REQUIRE_PATHS      = ['lib']
GEM_CERT_CHAIN         = ['certs/sensu-plugins.pem']
DEV_DEPENDENCIES       = [{ name: 'codeclimate-test-reporter', version: '~> 0.4' },
                          { name: 'rubocop',                   version: '~> 0.30' },
                          { name: 'rspec',                     version: '~> 3.1' },
                          { name: 'bundler',                   version: '~> 1.7' },
                          { name: 'rake',                      version: '~> 10.0' },
                          { name: 'github-markup',             version: '~> 1.3' },
                          { name: 'redcarpet',                 version: '~> 3.2' },
                          { name: 'yard',                      version: '~> 0.8' },
                          { name: 'pry',                       version: '~> 0.10' }]

TRAVIS_EMAIL = 'sensu-plugin@sensu-plugin.io'

# vagrantfile.erb
VAGRANT_BOX_NAME   = 'sensu-plugins-dev'
VAGRANT_BOX        = 'chef/centos-6.6' # , 'chef/freebsd-10.0', 'chef/ubuntu-14.04']
DOWNLOAD_CHECKSUM  = true
CHECKSUM_TYPE      = 'md5'

# readme.md.erb
PUBLIC_KEY = 'https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem'

#######################################
#                                     #
# Github Configurations               #
#                                     #
#######################################

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
# PLUGIN_CLONE_ADDRESS         = "git@github.com:sensu-plugins/sensu-plugins-#{ @plugin_name }.git"
RELEASE_DRAFT                = ENV['draft'] || false
RELEASE_PRERELEASE           = ENV['prerelease'] || false

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
GITHUB_REMOVABLE_STD_LABELS  = %w(duplicate invalid wontfix question enhancement bug)

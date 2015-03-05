#! /usr/bin/env ruby
#
# helpers
#
#
# DESCRIPTION:
#   Helpers for sensu-plugins rake tasks
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

# Get the current version or a plugin
#
def acquire_current_version
  Dir.chdir(acquire_chdir_path)
  File.read("lib/#{@gem_root}.rb").match(/\d+\.\d+\.\d+.*/)
end

# Set the desired version of the plugin
#
def new_version(text, bump)
  ver = text.match(/\d+\.\d+\.\d+/).to_s.split('.')
  major = ver[0].to_i
  minor = ver[1].to_i
  patch = ver[2].to_i
  case bump
  when 'patch'
    patch += 1
  when 'minor'
    minor += 1
  when 'major'
    major += 1
  end
  "#{ major }.#{ minor }.#{ patch }"
end

# Get the latest release of a gem from rubygems
#
def acquire_latest_gem_release(gem)
  begin
    gem_ver = JSON.parse(`curl -s "https://rubygems.org/api/v1/versions/#{ gem }.json"`)
    @g = gem_ver[0]['number']
  rescue
    @g = 'none'
  end
end

# Grab the list of all labels currently configured.
# This is used to check to see if a label exists before creating or deleting
# it as the api will not exit gracefully if this occurs
#
def acquire_label_list
  set_auth
  set_github_repo_name
  @current_list = []
  (@github.issues.labels.list user: GITHUB_ORG,
                              repo: @github_repo).each do |l|
    @current_list << l[:name]
  end
end

# Grab the list of all repos in an org.
# This is used to check to see if a repo exists before creating it
# as the api will not exit gracefully if this occurs
#
def acquire_repo_list
  set_auth
  set_github_repo_name
  @repo_list = []
  (@github.repos.list org: GITHUB_ORG).each do |l|
    @repo_list << l[:name]
  end
end

# Get a list of all milestones
#
def acquire_ms_list
  set_auth
  set_github_repo_name
  @ms_list = []
  (@github.issues.milestones.list user: GITHUB_ORG,
                                  repo: @github_repo).each do |l|
    @ms_list << l[:title]
  end
end

# Github token used for auth
#
def set_auth
  @github = Github.new do |c|
    c.oauth_token = GITHUB_TOKEN
  end
end

# Create the repo name based upon the plugin
#
def set_github_repo_name(plugin)
  @github_repo = "sensu-plugins-#{ plugin }"
end

# Get the template to build
#
def get_template(input)
  File.read(input)
end

# Set the proper path for the plugin repo
#
def acquire_chdir_path
  @plugin_dir.nil? ? PLUGINS_DIR : @plugin_dir
end

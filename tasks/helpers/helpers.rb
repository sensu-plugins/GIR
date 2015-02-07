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

# Grab the list of all labels currently configured.
# This is used to check to see if a label exists before creating or deleting
# it as the api will not exit gracefully if this occurs
#
def acquire_label_list
  set_auth
  @current_list = []
  (@github.issues.labels.list user: GITHUB_ORG,
                              repo: GITHUB_REPO).each do |l|
    @current_list << l[:name]
  end
end

# Grab the list of all repos in an org.
# This is used to check to see if a repo exists before creating it
# as the api will not exit gracefully if this occurs
#
def acquire_repo_list
  set_auth
  @repo_list = []
  (@github.repos.list org: GITHUB_ORG).each do |l|
    @repo_list << l[:name]
  end
end

# Github token used for auth
#
def set_auth
  @github = Github.new do |c|
    c.oauth_token = GITHUB_TOKEN
  end
end

def get_template
  File.read(TEMPLATE_FILE)
end

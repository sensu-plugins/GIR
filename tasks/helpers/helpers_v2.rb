# Get the url of a plugin
#
# @param plugin [string] the plugin
#
# @return [string] the plugin url
#
def plugin_url(plugin)
  ['git@github.com:sensu-plugins/', plugin, '.git'].compact.join('')
end

# Get the path to the local repo of a plugin
#
# @param plugin [string] the plugin
#
# @return [string] the absolute local plugin repo path
#
def local_plugin_repo(plugin)
  File.join("#{ PROJECT_ROOT }", "sensu-plugins-#{ plugin }")
end

# Grab the list of all repos in an org.
# This is used to check to see if a repo exists before creating it
# as the api will not exit gracefully if this occurs
#
def acquire_repo_list
  set_auth
  set_github_repo_name
  repo_list = []
  (@github.repos.list org: GITHUB_ORG).each do |l|
    repo_list << l[:name]
  end
  repo_list
end

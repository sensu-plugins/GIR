# Get the url of a plugin
#
# @param plugin [string] the plugin
#
# @return [string] the plugin url
#
def plugin_url(plugin)
  ['git@github.com:sensu-plugins/sensu-plugins-', plugin, '.git'].compact.join('')
end

# Get the path to the local repo of a plugin
#
# @param plugin [string] the plugin
#
# @return [string] the relative local plugin repo path
#
def local_plugin_repo(plugin)
  ['sensu-plugins-', plugin].compact.join('')
end

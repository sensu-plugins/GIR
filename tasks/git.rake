namespace :git do

  desc 'Clone a plugin repo'
  task :clone do
    `git clone #{ PLUGIN_CLONE_ADDRESS }`
  end

  desc 'Fetch a plugin repo'
  task :fetch do
    `git fetch #{ PLUGIN_CLONE_ADDRESS }`
  end

  desc 'Pull and rebase a plugin repo'
  task :pull do
    `git pull --rebase #{ PLUGIN_CLONE_ADDRESS }`
  end

end

namespace :git do

  desc 'Clone a plugin repo'
  task :clone, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    # convert plugin to an array by default
    plugins = args.plugin.split(' ')
    plugins.each do |p|
      `git clone #{ local_plugin_repo(p) }`
    end
  end

  desc 'Fetch a plugin repo'
  task :fetch, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    # convert plugin to an array by default
    plugins = args.plugin.split(' ')
    plugins.each do |p|
      `git fetch #{ local_plugin_repo(p) }`
    end
  end

  desc 'Pull and rebase a plugin repo'
  task :pull, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    # convert plugin to an array by default
    plugins = args.plugin.split(' ')
    plugins.each do |p|
      puts `git pull --rebase #{ local_plugin_repo(p) }`
    end
  end
end

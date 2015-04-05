namespace :git do

  desc 'Clone a plugin repo'
  task :clone, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    `git clone #{ plugin_url(args.plugin) }`
  end

  desc 'Fetch a plugin repo'
  task :fetch, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    `git fetch #{ plugin_url(args.plugin) }`
  end

  desc 'Pull and rebase a plugin repo'
  task :pull, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    `git pull --rebase #{ plugin_url(args.plugin) }`
  end
end

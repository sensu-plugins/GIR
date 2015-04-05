namespace :test do

  desc 'run rubocop to detect styntax errors'
  task :rubocop, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    # convert plugin to an array by default
    plugins = args.plugin.split(' ')
    plugins.each do |p|
      puts `rubocop #{ local_plugin_repo(p) }`
    end
  end

  desc 'run rubocop to detect and attempt to fix syntax errors'
  task :rubocop_fix, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    # convert plugin to an array by default
    plugins = args.plugin.split(' ')
    plugins.each do |p|
      puts `rubocop -a #{ local_plugin_repo(p) }`
    end
  end

  desc 'run rspec against the repo'
  task :rspec, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    # convert plugin to an array by default
    plugins = args.plugin.split(' ')
    plugins.each do |p|
      puts `rspec #{ local_plugin_repo(p) }`
    end
  end
end

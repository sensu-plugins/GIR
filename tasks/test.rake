namespace :test do

  desc 'run rubocop to detect styntax errors'
  task :rubocop, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    puts `rubocop #{ local_plugin_repo(args.plugin) }`
  end

  desc 'run rubocop to detect and attempt to fix syntax errors'
  task :rubocop_fix, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    puts `rubocop -a #{ local_plugin_repo(args.plugin) }`
  end
end

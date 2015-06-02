namespace :git do
  #
  # Clone one or more repos.
  # To clone a single repo use
  #
  # `rake git:clone[disk-checks]`
  # To clone multiple repos use
  # `rake git:clone["disk-checks cpu-checks process-checks"]
  #
  desc 'Clone one or more repos'
  task :clone, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    args.plugin.split(' ').each do |p|
      `git clone #{ plugin_url(p) }`
    end
  end

  #
  # Clone all public repos.
  # To clone all public repos use
  #
  # `rake git:clone_all`
  #
  desc 'Clone all sensu-plugin public repos'
  task :clone_all do
    acquire_repo_list.each do |p|
      `git clone #{ plugin_url(p) }`
    end
  end

  #
  # Fetch one or more repos.
  # To fetch a single repo use
  #
  # `rake git:fetch[disk-checks]`
  # To fetch multiple repos use
  # `rake git:fetch["disk-checks cpu-checks process-checks"]
  #
  desc 'Fetch one or more repos'
  task :fetch, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    args.plugin.split(' ').each do |p|
      Dir.chdir(local_plugin_repo(p)) do
        `git fetch #{ plugin_url(p) }`
      end
    end
  end

  #
  # Pull one or more repos.  By default this will rebase, as it should
  # To pull a single repo use
  #
  # `rake git:pull[disk-checks]`
  # To pull multiple repos use
  # `rake git:pull["disk-checks cpu-checks process-checks"]
  #
  desc 'Pull and rebase one or more plugin repos'
  task :pull, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    args.plugin.split(' ').each do |p|
      Dir.chdir(local_plugin_repo(p)) do
        puts `git pull --rebase`
      end
    end
  end

  #
  # Commit and push all changes to a plugin
  # To commit and push a single repo use
  #
  # `rake git:push[disk-checks "this is my message"]`
  #
  desc 'Commit and push all changes to a plugin'
  task :push, :plugin, :message do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    message = args.message || 'update_repo'
    Dir.chdir(local_plugin_repo(p)) do
      `git add --all`
      `git commit -m "{ message }"`
      puts `git pull --rebase`
      puts `git push origin master`
    end
  end

  #
  # Commit and push multiple repos.
  # To commit and push multiple repos use
  #
  # `rake git:push["disk-checks cpu-checks process-checks" "this is my message"]`
  #
  # desc 'Commit and push all changes to multiple plugins'
  # task :push, :plugin, :message do |_t, args|
  #   if args.plugin.nil?
  #     puts 'A plugin must be provided'
  #     exit
  #   end
  #   message = args.message || 'update_repo'
  #   args.plugin.split(' ').each do |p|
  #     Dir.chdir(local_plugin_repo(p)) do
  #       `git add --all`
  #       `git commit -m "{ message }"`
  #       puts `git pull --rebase`
  #       puts `git push origin master`
  #     end
  #   end
  # end

  #
  # Launch a deploy for one or more plugins.
  # To deploy a single repo use
  #
  # `rake git:deploy[disk-checks]`
  # To deploy multiple repos use
  # `rake git:deploy["disk-checks cpu-checks process-checks"]
  #
  desc 'Launch a deploy for one or more plugins'
  task :deploy, :plugin do |_t, args|
    if args.plugin.nil?
      puts 'A plugin must be provided'
      exit
    end
    args.plugin.split(' ').each do |p|
      Dir.chdir(local_plugin_repo(p)) do
        `git add --all`
        `git commit -m 'deploy'`
        puts `git pull --rebase`
        puts `git push origin master`
      end
    end
  end
end

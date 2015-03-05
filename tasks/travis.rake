# There is a lot of ugliness here due to Travis.  When working with open source repos
# they have no ability to remove a repo once it has been added so all repos going back
# to the beginning of time would be included in a list all repos.  This would then fail
# most call as the repo no longer exists.  So to get a list of repos, you will need to
# query github and pass that onto Travis.
#
namespace :travis do

  desc 'Get the vurrent build status of a repo, by default will return all repos'
  task :status do
    fail_list = ['GIR']
    if ENV['plugin']
      plugin = Travis::Repository.find("#{ GITHUB_ORG }/#{ @gem_root}")
      puts " Build Number: #{ plugin.last_build.number }  State: #{plugin.last_build.state }"
    else
      p1 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=1'`
      p2 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=2'`
      p3 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=3'`
      p4 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=4'`
      p5 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=5'`
      p6 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=6'`
      p7 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=7'`
      p8 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=8'`
      printf("%-30s %-30s %-60s\n", 'Plugin', 'Build Number', 'Status')
      p1.each_line do |p|
        if p.include?("\"name\":")
          plugin = p.split("\"")[3]
          puts plugin
          if ! fail_list.include?(plugin)
            b = Travis::Repository.find("#{ GITHUB_ORG }/#{ plugin }")
            printf("%-30s %-30s %-60s\n", plugin, b.last_build.number, b.last_build.state)
          end
        end
      end
    end
  end

  task :new_status do
    fail_list = ['GIR', 'sensu-plugins-handlers', 'sensu-plugins-mutators', 'sensu-plugins-extensions']
  end


end

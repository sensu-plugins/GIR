#! /usr/bin/env ruby
#
# github.rake
#
# DESCRIPTION:
#   These are designed to create and work with Github repos
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

namespace :github do
  desc 'Create a specific set of labels that are mapped to waffle.io'
  task :create_sensu_plugins_labels do
    acquire_label_list
    STD_PLUGIN_LABELS.each do |s|
      @github.issues.labels.create name:  s[:name],
                                   color: s[:color],
                                   user:  GITHUB_ORG,
                                   repo:  @github_repo unless @current_list.include?(s[:name])
    end
  end

  desc 'Create an initial milestone'
  task :create_initial_milestone do
    acquire_ms_list
    @github.issues.milestones.create title: GITHUB_INITIAL_MILESTONE,
                                     user:  GITHUB_ORG,
                                     repo:  @github_repo unless @ms_list.include?(GITHUB_INITIAL_MILESTONE)
  end

  desc 'Delete a set of labels that we don\'t have mapped or need'
  task :delete_github_labels do
    acquire_label_list
    GITHUB_REMOVABLE_STD_LABELS.each do |s|
      @github.issues.labels.delete label_name: s,
                                   user: GITHUB_ORG,
                                   repo: @github_repo if @current_list.include?(s)
    end
  end

  , :name do |_t, args|
    # RELEASE_DRAFT                = ENV['draft'] || false
    # RELEASE_PRERELEASE           = ENV['prerelease'] || false



  desc 'Create a release on Github'
  task :create_release ,:plugin, :draft, :prerelease do |_t, args| do
    set_auth
    set_github_repo_name(args.repo)

    @github.repos.releases.create GITHUB_ORG, @github_repo, "v#{ acquire_current_version }",
                                  tag_name: "v#{ acquire_current_version }",
                                  target_commitish: ENV['commit'] || 'master',
                                  name: "v#{ acquire_current_version }",
                                  body: ENV['description'],
                                  draft: args.draft || false,
                                  prerelease: args.prerelease || false
  end

  # I know this is an ugly hack, I will fork the github_api and fix it or do something else when I have time.  This works and is stable so f it for now.
  desc 'Get a list of all plugin repos'
  task :list_repos do
    set_auth
    printf("%-40s %-40s %-70s\n", 'Name', 'Plugin', 'Description')
    p1 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=1'`
    p2 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=2'`
    p3 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=3'`
    p4 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=4'`
    p5 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=5'`
    p6 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=6'`
    p7 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=7'`
    p8 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=8'`

    p1.each_line do |p|
      if p.include?("\"name\":")
        plugin = p.split("\"")[3].gsub(/sensu-plugins-/, '')
        name = p.split("\"")[3]
        printf('%-40s %-40s', name, plugin)
      elsif p.include?("\"description\":")
        description = p.split("\"")[3]
        printf("%-70s\n", description)
      end
    end
    p2.each_line do |p|
      if p.include?("\"name\":")
        plugin = p.split("\"")[3].gsub(/sensu-plugins-/, '')
        name = p.split("\"")[3]
        printf('%-40s %-40s', name, plugin)
      elsif p.include?("\"description\":")
        description = p.split("\"")[3]
        printf("%-70s\n", description)
      end
    end
    p3.each_line do |p|
      if p.include?("\"name\":")
        plugin = p.split("\"")[3].gsub(/sensu-plugins-/, '')
        name = p.split("\"")[3]
        printf('%-40s %-40s', name, plugin)
      elsif p.include?("\"description\":")
        description = p.split("\"")[3]
        printf("%-70s\n", description)
      end
    end
    p4.each_line do |p|
      if p.include?("\"name\":")
        plugin = p.split("\"")[3].gsub(/sensu-plugins-/, '')
        name = p.split("\"")[3]
        printf('%-40s %-40s', name, plugin)
      elsif p.include?("\"description\":")
        description = p.split("\"")[3]
        printf("%-70s\n", description)
      end
    end
    p5.each_line do |p|
      if p.include?("\"name\":")
        plugin = p.split("\"")[3].gsub(/sensu-plugins-/, '')
        name = p.split("\"")[3]
        printf('%-40s %-40s', name, plugin)
      elsif p.include?("\"description\":")
        description = p.split("\"")[3]
        printf("%-70s\n", description)
      end
    end
    p6.each_line do |p|
      if p.include?("\"name\":")
        plugin = p.split("\"")[3].gsub(/sensu-plugins-/, '')
        name = p.split("\"")[3]
        printf('%-40s %-40s', name, plugin)
      elsif p.include?("\"description\":")
        description = p.split("\"")[3]
        printf("%-70s\n", description)
      end
    end
    p7.each_line do |p|
      if p.include?("\"name\":")
        plugin = p.split("\"")[3].gsub(/sensu-plugins-/, '')
        name = p.split("\"")[3]
        printf('%-40s %-40s', name, plugin)
      elsif p.include?("\"description\":")
        description = p.split("\"")[3]
        printf("%-70s\n", description)
      end
    end
    p8.each_line do |p|
      if p.include?("\"name\":")
        plugin = p.split("\"")[3].gsub(/sensu-plugins-/, '')
        name = p.split("\"")[3]
        printf('%-40s %-40s', name, plugin)
      elsif p.include?("\"description\":")
        description = p.split("\"")[3]
        printf("%-70s\n", description)
      end
    end
  end

  # I know this is an ugly hack, I will fork the github_api and fix it or do something else when I have time.  This works and is stable so f it for now.  This has only been tested when a repo has a single release, if multiple releases it may not work.
  desc 'List releases for a repo'
  task :list_releases do
    plugin_list = []
    set_auth
    p1 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=1'`
    p2 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=2'`
    p3 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=3'`
    p4 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=4'`
    p5 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=5'`
    p6 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=6'`
    p7 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=7'`
    p8 = `curl -s 'https://api.github.com/orgs/sensu-plugins/repos?page=8'`

    p1.each_line do |p|
      plugin_list << p.split("\"")[3] if p.include?("\"name\":")
    end
    p2.each_line do |p|
      plugin_list << p.split("\"")[3] if p.include?("\"name\":")
    end
    p3.each_line do |p|
      plugin_list << p.split("\"")[3] if p.include?("\"name\":")
    end
    p4.each_line do |p|
      plugin_list << p.split("\"")[3] if p.include?("\"name\":")
    end
    p5.each_line do |p|
      plugin_list << p.split("\"")[3] if p.include?("\"name\":")
    end
    p6.each_line do |p|
      plugin_list << p.split("\"")[3] if p.include?("\"name\":")
    end
    p7.each_line do |p|
      plugin_list << p.split("\"")[3] if p.include?("\"name\":")
    end
    p8.each_line do |p|
      plugin_list << p.split("\"")[3] if p.include?("\"name\":")
    end

    printf("%-40s %-40s %-40s\n", 'Name', 'Github Release', 'Gem Release')
    plugin_list.each do |p|
      acquire_latest_gem_release(p)
      rel_ver = @github.repos.releases.list GITHUB_ORG, p
      r = (rel_ver[0][:name] if !rel_ver.empty?) || 'none'
      printf("%-40s %-40s %-40s\n", p, r, @g)
    end
  end

  desc 'Create a github repo with the necessary features(requires org Admin privilages)'
  task :create_repo do
    acquire_repo_list
    @github.repos.create name: @github_repo,
                         description: 'Add a description',
                         homepage: SENSU_PLUGINS_HOMEPAGE,
                         private: PRIVATE_REPO,
                         has_issues: GITHUB_ISSUES,
                         has_wiki: GITHUB_WIKI,
                         auto_init: GITHUB_AUTO_INIT,
                         has_downloads: @github_repo_DOWNLOADS,
                         team_id: TEAM_ID,
                         org: GITHUB_ORG unless @repo_list.include?(@github_repo)
    Rake::Task['github:delete_github_labels'].invoke
    Rake::Task['github:create_sensu_plugins_labels'].invoke
    Rake::Task['github:create_initial_milestone'].invoke
  end
end

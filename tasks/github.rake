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
  task :create_sensu_plugins_labels => ['create_repo']  do
    acquire_label_list
    STD_PLUGIN_LABELS.each do |s|
      @github.issues.labels.create name:  s[:name],
                                   color: s[:color],
                                   user:  GITHUB_ORG,
                                   repo:  @github_repo unless @current_list.include?(s[:name])
    end
  end

  desc 'Create an initial milestones'
  task :create_initial_milestone => ['create_repo']  do
    acquire_ms_list
    @github.issues.milestones.create title: GITHUB_INITIAL_MILESTONE,
                                     user:  GITHUB_ORG,
                                     repo:  @github_repo unless @ms_list.include?(GITHUB_INITIAL_MILESTONE)
  end

  desc 'Delete a set of labels that we don\'t have mapped or need'
  task :delete_github_labels => ['create_repo'] do
    acquire_label_list
    GITHUB_REMOVABLE_STD_LABELS.each do |l|
      @github.issues.labels.delete label_name: l,
                                   user: GITHUB_ORG,
                                   repo: @github_repo if @current_list.include?(l)
    end
  end

  desc 'Create a github repo with the necessary features'
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
     Rake::Task['github:create_sensu_plugins_labels'].invoke
     Rake::Task['github:delete_github_labels'].invoke
     Rake::Task['github:create_initial_milestone'].invoke
  end
end

namespace :config do
  desc 'Displays a list of the current global paths'
  task :path do
    printf("%-60s %-60s\n", 'Project Directory', PROJECT_DIR)
    printf("%-60s %-60s\n", 'ERB Template Directory', TEMPLATE_DIR)
    printf("%-60s %-60s\n", 'Static File Directory', STATIC_DIR)
    printf("%-60s %-60s\n", 'Plugins Directory', PLUGINS_DIR)
  end

  desc 'Display a list of currently configured Github variables'
  task :github do
    if PRIVATE_REPO == false
      repo = 'Public'
    else
      repo = 'Private'
    end

    printf("%-60s %-60s\n", 'Github Org', GITHUB_ORG)
    printf("%-60s %-60s\n", 'Github TeamID', TEAM_ID)
    printf("%-60s %-60s\n", 'Initial Github Milestone', GITHUB_INITIAL_MILESTONE)
    printf("%-60s %-60s\n", 'Default Repo', repo)
    printf("%-60s %-60s\n", 'Github Issues Enabled', GITHUB_ISSUES)
    printf("%-60s %-60s\n", 'Github Wiki Enabled', GITHUB_WIKI)
    printf("%-60s %-60s\n", 'Perform an initial commit', GITHUB_AUTO_INIT)
    printf("%-60s %-60s\n", 'Allow Downloads', GITHUB_REPO_DOWNLOADS)
    printf("%-60s %-60s\n", 'Github Token', acquire_git_token)
  end

  desc 'Display a list of currently configured Gem Specification Variables'
  task :gem do
    printf("%-60s %-60s\n", 'Required Mininum Ruby Version', REQUIRED_RUBY_VERSION)
    printf("%-60s %-60s\n", 'Gem Author', GEM_AUTHOR)
    printf("%-60s %-60s\n", 'Gem Email', GEM_EMAIL)
    printf("%-60s %-60s\n", 'Gem License', GEM_LICENSE)
    printf("%-60s %-60s\n", 'Required Gem Paths', GEM_REQUIRE_PATHS)
    printf("%-60s %-60s\n", 'Gem Public Certs', GEM_CERT_CHAIN)
    printf("%-60s %-60s\n", 'Gem Platform', Gem::Platform::RUBY)
    DEV_DEPENDENCIES.each do |d|
      printf("%-60s %-60s\n", d[:name], d[:version])
    end
  end
end

desc 'Boilerplater template variables'
task :boilerplate do
end

# LICENSE_EMAIL = 'devops@yieldbot.com'
# GEM_INITIAL_VERSION = '0.0.1.alpha.1'

namespace :test do

  desc 'run rubocop to detect styntax errors'
  task :rubocop do
    set_github_repo_name
    puts `rubocop #{ @github_repo }`
  end

  desc 'run rubocop to detect and attempt to fix syntax errors'
  task :rubocop_fix do
    set_github_repo_name
    puts `rubocop -a #{ @github_repo }`

  end
end

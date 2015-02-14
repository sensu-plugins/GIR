namespace :workflow do
  desc 'Bump the patch version of a gem'
  task :bump_patch do
    bump = 'patch'
    Dir.chdir(acquire_chdir_path)
    text = File.read("lib/#{@gem_root}.rb")
    File.write("lib/#{@gem_root}.rb", text.gsub(/\d+\.\d+\.\d+/, new_version(text, bump)))
  end

  desc 'Bump the major version of a gem'
  task :bump_major do
    bump = 'major'
    Dir.chdir(acquire_chdir_path)
    text = File.read("lib/#{@gem_root}.rb")
    File.write("lib/#{@gem_root}.rb", text.gsub(/\d+\.\d+\.\d+/, new_version(text, bump)))
  end

  desc 'Bump the minor version of a gem'
  task :bump_minor do
    bump = 'minor'
    Dir.chdir(acquire_chdir_path)
    text = File.read("lib/#{@gem_root}.rb")
    File.write("lib/#{@gem_root}.rb", text.gsub(/\d+\.\d+\.\d+/, new_version(text, bump)))
  end

  desc 'Push the gem to RubyGems(requires Account credentials)'
  task :push_gem do
    Dir.chdir(acquire_chdir_path)
    `gem push *.gem`
  end

  desc 'Build a gem(requies pvt signing key)'
  task :build_gem do
    Dir.chdir(acquire_chdir_path)
    `gem build #{ @gem_root }.gemspec`
  end

  desc 'Remove a repo'
  task :remove_repo do
    `rm -rf #{ @gem_root }`
  end
end

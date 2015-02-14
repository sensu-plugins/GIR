namespace :gem do
  desc 'Generate the gem License from a template'
  task :drop_license do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'LICENSE.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/LICENSE"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  desc 'Generate a version module from a template'
  task :drop_version do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'sensu-plugins-version.rb.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/lib/#{ @gem_root }.rb"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  desc 'Generate an initial CHANGELOG from a template'
  task :drop_changelog do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'CHANGELOG.md.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/CHANGELOG.md"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  desc 'Generate a copy of the Developer\'s Guidelines from a template'
  task :drop_contributing do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'CONTRIBUTING.md.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/CONTRIBUTING.md"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  desc 'Generate an inital README from a template'
  task :drop_readme do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'README.md.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/README.md"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  desc 'Generate an initial gemspec from a template'
  task :drop_gemspec do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'sensu-plugins.gemspec.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/#{ @gem_root }.gemspec"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  desc 'Generate a Vagrantfile from a template'
  task :drop_vagrantfile do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'Vagrantfile.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/Vagrantfile"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  desc 'Generate a rakefile from a template'
  task :drop_rakefile do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'Rakefile.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/Rakefile"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  desc 'Generate a rubocop file from a template'
  task :drop_rubocop do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'rubocop.yml.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/.rubocop.yml"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  desc 'Generate a travisCI file from a template'
  task :drop_travis do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'travis.yml.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/.travis.yml"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  desc 'Scaffold a base directory similar to `bundle gem`'
  # need to check if it exists first
  # this will fold into using this to update gems as well
  task :boilerplate do
    require 'erb' # this should be moved out to the Rakefile
    # need to validate the name follows some convention
    mkdir @gem_root
    chdir @gem_root
    `git init`
    `git remote add origin git@github.com:sensu-plugins/#{ @gem_root }.git`
    mkdir_p ["lib/#{ @gem_root }", 'bin']
    cp(File.join(GEM_STATIC_DIR, 'Gemfile'), '.', verbose: false)
    cp(File.join(GEM_STATIC_DIR, 'gitignore'), './.gitignore', verbose: false)
    cp_r(File.join(GEM_STATIC_DIR, 'certs'), '.', verbose: false)
    cp_r(File.join(GEM_STATIC_DIR, 'test'), '.', verbose: false)
    Rake::Task['gem:drop_license'].invoke
    Rake::Task['gem:drop_version'].invoke
    Rake::Task['gem:drop_changelog'].invoke
    Rake::Task['gem:drop_contributing'].invoke
    Rake::Task['gem:drop_readme'].invoke
    Rake::Task['gem:drop_gemspec'].invoke
    Rake::Task['gem:drop_vagrantfile'].invoke
    Rake::Task['gem:drop_rakefile'].invoke
    Rake::Task['gem:drop_rubocop'].invoke
    Rake::Task['gem:drop_travis'].invoke
  end
end

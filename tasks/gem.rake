namespace :gem do

  task :license do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'LICENSE.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/LICENSE"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :version do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'sensu-plugins-version.rb.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/lib/#{ @gem_root }.rb"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :changelog do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'CHANGELOG.md.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/CHANGELOG.md"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :contributing do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'CONTRIBUTING.md.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/CONTRIBUTING.md"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :readme do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'README.md.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/README.md"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :gemspec do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'sensu-plugins.gemspec.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/#{ @gem_root }.gemspec"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :vagrantfile do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'Vagrantfile.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/Vagrantfile"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :rakefile do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'Rakefile.erb')

    File.open(File.join(PROJECT_DIR, "#{ @gem_root }/Rakefile"), 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  # need to check if it exists first
  # this will fold into using this to update gems as well
  task :boilerplate do
    require 'erb' # this should be moved out to the Rakefile
    # need to validate the name follows some convention
    GEM_CLASS = @gem_root.split('-').map(&:capitalize).join

    mkdir @gem_root
    chdir @gem_root
    mkdir_p ["lib/#{ @gem_root }", 'bin']
    # puts @gem_root
    # puts GEM_STATIC_DIR
    cp_r(File.join(GEM_STATIC_DIR, 'certs'), '.', verbose: false)
    cp_r(File.join(GEM_STATIC_DIR, 'test'), '.', verbose: false)
    Rake::Task['gem:license'].invoke
    Rake::Task['gem:version'].invoke
    Rake::Task['gem:changelog'].invoke
    Rake::Task['gem:contributing'].invoke
    Rake::Task['gem:readme'].invoke
    Rake::Task['gem:gemspec'].invoke
    Rake::Task['gem:vagrantfile'].invoke
    Rake::Task['gem:rakefile'].invoke

  end
end

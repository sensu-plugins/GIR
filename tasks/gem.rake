namespace :gem do

  task :license do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'LICENSE.erb')

    File.open("#{ GEM_ROOT }/LICENSE", 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :version do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'templates/gem/sensu-plugins-version.rb.erb')

    File.open("lib/#{ GEM_ROOT }.rb", 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :changelog do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'CHANGELOG.md.erb')

    File.open("#{ GEM_ROOT }/CHANGELOG.md", 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :contributing do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'CONTRIBUTING.md.erb')

    File.open("#{ GEM_ROOT }/CONTRIBUTING.md", 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :readme do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'README.md.erb')

    File.open("#{ GEM_ROOT }/README.md", 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :gemspec do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, '#{ GEM_ROOT }.gemspec.erb')

    File.open("#{ GEM_ROOT }/#{ GEM_ROOT }.gemspec", 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :vagrantfile do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'Vagrantfile.erb')

    File.open("#{ GEM_ROOT }/Vagrantfile", 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  task :rakefile do
    require 'erb' # this should be moved out to the Rakefile
    template_file = File.join(GEM_TEMPLATE_DIR, 'Rakefile.erb')

    File.open("#{ GEM_ROOT }/Rakefile", 'w+') do |f|
      f.write(ERB.new(get_template(template_file)).result)
    end
  end

  # need to check if it exists first
  # this will fold into using this to update gems as well
  task :boilerplate do
    require 'erb' # this should be moved out to the Rakefile
    # need to validate the name follows some convention
    GEM_CLASS = GEM_ROOT.split('-').map(&:capitalize).join

    mkdir GEM_ROOT
    chdir GEM_ROOT
    mkdir_p ["lib/#{ GEM_ROOT }", 'bin']
    # puts GEM_ROOT
    # puts GEM_STATIC_DIR
    cp_r(File.join(GEM_STATIC_DIR, 'certs'), '.', verbose: false)
    cp_r(File.join(GEM_STATIC_DIR, 'test'), '.', verbose: false)
    # Rake::Task[:license].invoke
    # Rake::Task[:version].invoke
    # Rake::Task[:changelog].invoke
    # Rake::Task[:contributing].invoke
    # Rake::Task[:readme].invoke
    # Rake::Task[:gemspec].invoke
    # Rake::Task[:vagrantfile].invoke
    # Rake::Task[:Rakefile].invoke

  end
end

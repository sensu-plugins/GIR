namespace :gem do

  task :license do
    require 'erb' # this should be moved out to Rakefile
    OUTPUT_FILE = 'LICENSE'
    TEMPLATE_FILE = File.join(TEMPLATE_DIR, 'gem/LICENSE.erb')

    # def get_template
    #   File.read(TEMPLATE_FILE)
    # end
    #
    File.open(OUTPUT_FILE, "w+") do |f|
      f.write(ERB.new(get_template).result())
    end
  end

  task :boilerplate do
    require 'erb' # this should be moved out to Rakefile

    GEM_ROOT = ENV['gem']
    # need to validate the name follows some convention
    GEM_CLASS = GEM_ROOT.split('-').collect(&:capitalize).join
    TEMPLATE_FILE = File.join(TEMPLATE_DIR, 'gem/sensu-plugins-version.rb.erb')
    OUTPUT_FILE = "lib/#{ GEM_ROOT }.rb"
    mkdir GEM_ROOT
    chdir GEM_ROOT
    mkdir_p ["lib/#{ GEM_ROOT }", 'bin']
    cp_r(File.join(TEMPLATE_DIR, 'gem/certs'), '.', :verbose => true)
    cp_r(File.join(TEMPLATE_DIR, 'gem/test'), '.', :verbose => true)

    # def get_template
    #   File.read(TEMPLATE_FILE)
    # end
    #
    File.open(OUTPUT_FILE, "w+") do |f|
      f.write(ERB.new(get_template).result())
    end

  end
end

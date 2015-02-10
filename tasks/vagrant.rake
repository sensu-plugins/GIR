namespace :vagrant do

  desc 'Destroy VM will also delete the repo from the local machine if \'remove\' is passed to the task'
  task :destroy do
    remove = ARGV.last
    task remove.to_sym do; end
    Dir.chdir(acquire_chdir_path) do
      run_command('vagrant destroy --force')
      rm_r(acquire_chdir_path) if remove == 'remove'
    end
  end

  desc 'Destroy VM in a clean manner will also delete the repo from the local machine if \'remove\' is passed to the task'
  task :destroy_clean do
    remove = ARGV.last
    task remove.to_sym do; end
    Dir.chdir(acquire_chdir_path) do
      puts acquire_chdir_path
      run_command('vagrant destroy --force')
      rm_r(acquire_chdir_path) if remove == 'remove'
    end
  end

  desc 'Flush the cachier cache for this VM'
  task :flush do
    Dir.chdir(acquire_chdir_path) do
      case `vagrant status`
      when /The VM is running/ then puts 'VM is running, please shutdown the instance prior to flushing'
      else system('rm -rf ./.vagrant/machines/default/cache')
      end
    end
  end

  desc 'Halt VM'
  task :halt do
    Dir.chdir(acquire_chdir_path) do
      run_command('vagrant halt --force')
    end
  end

  desc 'Halt VM in a clean manner'
  task :halt_clean do
    Dir.chdir(acquire_chdir_path) do
      run_command('vagrant halt')
    end
  end

  desc 'Reload the Vagrantfile'
  task :reload do
    Dir.chdir(acquire_chdir_path) do
      run_command('vagrant reload')
    end
  end

  desc 'SSH into the VM'
  task :ssh do
    Dir.chdir(acquire_chdir_path) do
      run_command('vagrant ssh')
    end
  end

  desc 'Get the status of the VM'
  task :status do
    Dir.chdir(acquire_chdir_path) do
      puts Dir.pwd
      run_command('vagrant status')
    end
  end

  desc 'Start the VM, will automatically perform a git clone if the repo is not present on the local machine'
  task :up do
      if Dir.exist?(acquire_chdir_path)
        Dir.chdir(acquire_chdir_path) do
        run_command('vagrant up')
      end
      else
        Rake::Task['git:clone'].invoke
        Dir.chdir(acquire_chdir_path) do
          run_command('vagrant up')
        end
      end
    end

  desc 'Start up a VM and provision it, will automatically perform a git clone if the repo is not present on the local machine'
  task :up_provision do
    if Dir.exist?(acquire_chdir_path)
      Dir.chdir(acquire_chdir_path) do
      run_command('vagrant up --provision')
    end
    else
      Rake::Task['git:clone'].invoke
      Dir.chdir(acquire_chdir_path) do
        run_command('vagrant up --provision')
      end
    end
  end

task vagrant: 'vagrant:status'

def run_command(command)
  puts 'Starting Vagrant...'
  return_value = nil
  results = Benchmark.measure do
    system command
    return_value = $CHILD_STATUS
  end

  print_status(results, return_value)
end

def print_status(results, return_value)
  unless return_value.nil?
    time_str = "#{seconds_to_units(results.real)}"
    puts
    puts 'Vagrant Statistics:'
    puts 'Duration:   ' + (return_value.exitstatus == 0 ? time_str.green : time_str.red)
  end
end

def seconds_to_units(seconds)
  '%d days, %d hours, %d minutes, %d seconds' %
    # the .reverse lets us put the larger units first for readability
    [24, 60, 60].reverse.reduce([seconds]) do|result, unitsize|
      result[0, 0] = result.shift.divmod(unitsize)
      result
    end
  end
end

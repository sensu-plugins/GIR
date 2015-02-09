namespace :vagrant do

  desc 'Destroy VM used for development and testing'
  task :destroy do
    Dir.chdir(acquire_chdir_path) do
      run_command('vagrant destroy --force')
    end
  end

  desc 'Destroy VM used for development and testing in a clean manner'
  task :destroy_clean do
    Dir.chdir(acquire_chdir_path) do
      run_command('vagrant destroy')
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

  desc 'Halt VM used for development and testing'
  task :halt do
    Dir.chdir(acquire_chdir_path) do
      run_command('vagrant halt --force')
    end
  end

  desc 'Halt VM used for development and testing in a clean manner'
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

  desc 'Start up a VM for development and testing'
  task :up do
    Dir.chdir(acquire_chdir_path) do
      run_command('vagrant up')
    end
  end

  desc 'Start up a VM for development and testing and provision it'
  task :up_provision do
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

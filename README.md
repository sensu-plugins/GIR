![GIR](http://www.roomwithamoose.com/pictures/official/gir_suit_stand_optimized.jpg)

GIR is how developers can get things accomplished quickly, simply, and efficiently.  At the root it's nothing more than a ton of rake tasks for doing common things.  Where it gets helpful is when the sensu-plugins org grows to 20..30...40+ repos, then these tasks become awesome time and disk space savers.  

### Initial Setup

Create a directory called sensu-plugins and clone this repo and any others you will to work on into it, this will be the **PROJECT_DIRECTORY**.  Now copy the *Rakefile* from GIR to the project root.  You should have something like this:

/

/Rakefile

/GIR

/sensu-plugins-aws

/sensu-plugins-disk-checks

That's it.

You can see the list of available tasks using Rake -T.  Some of the tasks, primarily the Github ones, require a Github token with Admin rights but many of the others can be executed with no or very minor configuration. 


### Current Task List

```
rake gem:boilerplate                     # Scaffold a base directory similar to `bundle gem`
rake gem:changelog                       # Generate an initial CHANGELOG from a template
rake gem:contributing                    # Generate a copy of the Developer's Guidelines from a 
                                           template
rake gem:gemspec                         # Generate an initial gemspec from a template
rake gem:license                         # Generate the gem License from a template
rake gem:rakefile                        # Generate a rakefile from a template
rake gem:readme                          # Generate an inital README from a template
rake gem:vagrantfile                     # Generate a Vagrantfile from a template
rake gem:version                         # Generate a version module from a template
rake github:create_initial_milestone     # Create an initial milestone
rake github:create_repo                  # Create a github repo with the necessary features
                                           (requires org Admin privilages)
rake github:create_sensu_plugins_labels  # Create a specific set of labels that are mapped 
                                           to waffle.io
rake github:delete_github_labels         # Delete a set of labels that we don't have mapped or need
rake vagrant:destroy                     # Destroy VM will also delete the repo from 
                                           the local machine if 'remove' is passed to the task
rake vagrant:destroy_clean               # Destroy VM in a clean manner will also delete the 
                                           repo from the local machine if 'remove' is passed 
                                           to the task
rake vagrant:flush                       # Flush the cachier cache for this VM
rake vagrant:halt                        # Halt VM
rake vagrant:halt_clean                  # Halt VM in a clean manner
rake vagrant:reload                      # Reload the Vagrantfile
rake vagrant:ssh                         # SSH into the VM
rake vagrant:status                      # Get the status of the VM
rake vagrant:up                          # Start the VM, will automatically perform a git clone 
                                           if the repo is not present on the local machine
rake vagrant:up_provision                # Start up a VM and provision it, will automatically 
                                           perform a git clone if the repo is not present on 
                                           the local machine
```



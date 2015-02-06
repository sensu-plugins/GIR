![GIR](http://www.roomwithamoose.com/pictures/official/gir_suit_stand_optimized.jpg)

GIR is how things are going to get accomplished quickly, simply, and efficiently.  At the root it's nothing more than a ton of rake tasks for doing common things.  Where it gets important is when the plugins org grows to 20..30...40+ repos, then these tasks become awesome time savers.  We developed these and use them daily in our environment of 100+ cookbooks.

Currently there are two groups of tasks, those associated with managing Github repos and those associated with vagrant.

The Github tasks allow a sensu-plugins organization admin to rapidly create identical repos for any project.  The configuration for the repos is set in the [rake.rb](https://github.com/sensu-plugins/GIR/blob/master/config/rake.rb) file which will contain all data necessary to build repos, gems, and the development environment.

### Setup

Create a directory called sensu-plugins and clone this repo and any others you will to work on into it, this will be you project directory.  Now copy the *Rakefile* from GIR to the project root.  You should have something like this:

/

/Rakefile

/GIR

/sensu-plugins-aws

/sensu-plugins-disk-checks

That's it.

###Github Tasks

To create a new repo you merely type ` rake github:repo_scaffold repo=sensu-plugins-foo` from your project root.  This will create a repo on github under the sensu-plugins org with attributes matching those in the configuration file.  It will also create a standard set of issue labels that are already mapped to waffle.io and remove issue labels we don't care about. At some point in the near future the repo var will be an array for even faster creation of multiple identical repos.  Support for hooks and services is also forth coming.

###Vagrant Tasks

To use the vagrant boxes in every repo the tasks are identical to the stock command names.  From the project root you type `rake vagrant:up plugin=aws`, and then you can ssh into it using `rake vagrant:ssh plugin=aws`.  The name is the name of the repository minus *sensu-plugins*, which is why among other reasons naming will be strictly enforced. All standard vagrant commands should be  present.  Support for multi-machine setups is currently not present but will be coming very shortly as well as support for cloning the repo if it is not already present on your local machine.

###Testing Tasks
..

###Packaging Tasks
..





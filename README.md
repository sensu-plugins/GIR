![GIR](http://www.roomwithamoose.com/pictures/official/gir_suit_stand_optimized.jpg)

GIR is how developers can get things accomplished quickly, simply, and efficiently.  At the root it's nothing more than a ton of rake tasks for doing common things.  Where it gets helpful is when the sensu-plugins org grows to 20..30...40+ repos, then these tasks become awesome time and disk space savers.  

### Initial Setup

Create a directory called sensu-plugins and clone this repo and any others you will to work on into it, this will be the **PROJECT_ROOT**.  Now copy the *Rakefile* from GIR to the project root.  You should have something like this:

/

/Rakefile

/GIR

/sensu-plugins-aws

/sensu-plugins-disk-checks

That's it.

You can see the list of available tasks using Rake -T.  Some of the tasks, primarily the Github ones, require a Github token with Admin rights but many of the others can be executed with no or very minor configuration.


### USAGE

GIR is designed as a framework for working with the sensu-plugins as a whole.  There should be no need to clone specific repos or deal with them directly.  Once you clone GIR all common tasks necessary for developing with Sensu are available to you.  To interact with a specific repo you will use *plugin=X*, in order to launch vagrant for developing the sensu-aws-plugins you would issue the following commands from the **PROJECT_ROOT**

```ruby
rake vagrant:up plugin=aws   # clone the repo (if it is not already in PROJECT_ROOT and start the included default vagrant box
rake vagrant:ssh plugin=aws  # shh into the vagrant box
rake vagrant:halt plugin=aws # halt the vagrant box
rake vagrant:destroy plugin=aws # destroy the vagrant box
rake vagrant:destroy plugin=aws remove # destroy the vagrant box and remove the copy of the local repo
```

If you are unsure of which repos are available and what each contains `rake github:list_repos` will give your the repo name, plugin, and the description.

This will allow a developer to not have to worry about managing the various repos or even what ones exist, they can just work with a single repo or many and when done, remove them from their system if they chose.

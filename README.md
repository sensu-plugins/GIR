![GIR](http://www.roomwithamoose.com/pictures/official/gir_suit_stand_optimized.jpg)

GIR is how things developers  can get things accomplished quickly, simply, and efficiently.  At the root it's nothing more than a ton of rake tasks for doing common things.  Where it gets helpful is when the sensu-plugins org grows to 20..30...40+ repos, then these tasks become awesome time and disk space savers.  

### Initial Setup

Create a directory called sensu-plugins and clone this repo and any others you will to work on into it, this will be the **PROJECT_DIRECTORY**.  Now copy the *Rakefile* from GIR to the project root.  You should have something like this:

/

/Rakefile

/GIR

/sensu-plugins-aws

/sensu-plugins-disk-checks

That's it.

You can see the list of available tasks using Rake -T.  Some of the tasks, primarily the Github ones, require a Github token with Admin rights but many of the others can be executed with no or very minor configuration. 





name "cent_base"
description "A base role to configure a standard CentOS development environment"
run_list 'recipe[yum]',
         'recipe[yum-epel]',
         'recipe[yum-centos]',
         'recipe[yum-repoforge]',
         'recipe[plugins-dev]'

default_attributes(
 "chruby" => {
   "rubies" => {
     "1.9.3-p392" => false
   },
   "default" => "embedded"
 }
)

name "base"
description "A base role to configure a standard development environment"
run_list 'recipe[yum]',
         'recipe[yum-epel]',
         'recipe[yum-centos]',
         'recipe[yum-repoforge]',
         'recipe[plugins-dev]'

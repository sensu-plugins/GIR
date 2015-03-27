name "ubuntu_base"
description "A base role to configure a standard Ubuntu development environment"
run_list 'recipe[apt]',
        #  'recipe[yum-epel]',
        #  'recipe[yum-centos]',
        #  'recipe[yum-repoforge]',
         'recipe[plugins-dev]'

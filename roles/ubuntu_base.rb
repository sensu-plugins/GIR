name "ubuntu_base"
description "A base role to configure a standard Ubuntu development environment"
run_list 'recipe[apt]',
         'recipe[plugins-dev]'

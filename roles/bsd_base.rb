name "bsd_base"
description "A base role to configure a standard Freebsd development environment"
run_list 'recipe[freebsd::pkgng]',
         'recipe[plugins-dev]'

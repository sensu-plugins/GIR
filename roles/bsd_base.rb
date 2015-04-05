name 'bsd_base'
description 'A base role to configure a standard Freebsd development environment'
run_list 'recipe[freebsd::pkgng]',
         'recipe[plugins_dev]'

default_attributes(
'chruby' => {
  'rubies' => {
    '1.9.3-p392' => false
  },
  'default' => 'embedded'
}
)

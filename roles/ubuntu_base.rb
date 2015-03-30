name "ubuntu_base"
description "A base role to configure a standard Ubuntu development environment"
run_list 'recipe[apt]',
         'recipe[plugins_dev]'

default_attributes(
"chruby" => {
  "rubies" => {
    "1.9.3-p392" => false
  },
  "default" => "embedded"
}
)

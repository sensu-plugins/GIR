#
# Cookbook Name:: plugins-dev
# Recipe:: default
#
# Copyright 2015, sensu-plugins
#
# All rights reserved - Do Not Redistribute
#

package 'git' do
  action :install
end

package 'nano' do
  action :install
end

package 'wget' do
  action :install
end

case node['platform']
when 'centos'
  include_recipe 'plugins-dev::_cent_packages'
when 'ubuntu'
  include_recipe 'plugins-dev::_ubuntu_packages'
when 'freebsd'
  include_recipe 'plugins-dev::_bsd_packages'
end

# Install chruby to manage ruby versions
include_recipe 'chruby::default' unless node['platform'] == 'freebsd'

# Install or remove additional rubys
# These should be set in the plugin's Vagrantfile
# To push a new version to every plugin repo set it at the role level
include_recipe 'chruby::system' unless node['platform'] == 'freebsd'

# Install any gems into the default ruby as set by chruby
include_recipe 'plugins-dev::_development_gems' unless node['platform'] == 'freebsd'

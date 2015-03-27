#
# Cookbook Name:: plugins-dev
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

platform = "#{ node['platform'] }#{ node['platform_version'] }"
puts node['platform']
puts node['platform_version']

case platform
when 'centos6.6'
  include_recipe 'plugins-dev::_cent6_packages'
when 'centos7.0.1406'
  include_recipe 'plugins-dev::_cent7_packages'
when 'centos5.11'
  include_recipe 'plugins-dev::_cent5_packages'
when 'ubuntu14'
  include_recipe 'plugins-dev::_ubuntu14_packages'
end

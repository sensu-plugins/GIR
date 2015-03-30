#
# Cookbook Name:: plugins-dev
# Recipe:: _bsd_packages
#
# Copyright 2015, sensu-plugins
#

include_recipe 'freebsd::pkgng'

package 'vim' do
  action :install
end

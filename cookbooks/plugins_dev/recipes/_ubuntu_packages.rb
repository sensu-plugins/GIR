#
# Cookbook Name:: plugins-dev
# Recipe:: _ubuntu_packages
#
# Copyright 2015, sensu-plugins
#

apt_package 'emacs' do
  action :install
end

apt_package 'mlocate' do
  action :install
end

apt_package 'openssl' do
  action :install
end

apt_package 'vim' do
  action :install
end

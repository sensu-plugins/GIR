#
# Cookbook Name:: plugins-dev
# Recipe:: _cent_packages
#
# Copyright 2015, sensu-plugins
#

#### General Packages

yum_package 'emacs' do
  action :install
end

yum_package 'mlocate' do
  action :install
end

yum_package 'openssl' do
  action :install
end

yum_package 'vim-enhanced' do
  action :install
end

yum_package 'zlib' do
  action :install
end

yum_package 'zlib-devel' do
  action :install
end

#
# Cookbook Name:: plugins-dev
# Recipe:: default
#
# Copyright 2015, sensu-plugins
#
# All rights reserved - Do Not Redistribute
#

gem_package 'pry' do
  action :install
end

gem_package 'sensu-plugin' do
  version '1.1.0'
  action :install
end

gem_package 'rubocop' do
  version '0.17.0'
  action :install
end

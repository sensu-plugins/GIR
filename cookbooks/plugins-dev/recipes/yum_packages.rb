#
# Cookbook Name:: plugins-dev
# Recipe:: yum_packages
#
# Copyright 2015, sensu-plugins
#

#### General Packages

yum_package 'bash' do
  version '4.1.2-29.el6'
  allow_downgrade true
  action :install
end

yum_package 'bc' do
  version '1.06.95-1.el6'
  allow_downgrade true
  action :install
end

yum_package 'bind-utils' do
  version '9.8.2-0.30.rc1.el6_6.1'
  allow_downgrade true
  action :install
end

yum_package 'dmidecode' do
  version '2.12-5.el6_5'
  allow_downgrade true
  action :install
end

yum_package 'emacs' do
  version '23.1-25.el6'
  allow_downgrade true
  action :install
end

yum_package 'git' do
  version '1.7.1-3.el6_4.1'
  allow_downgrade true
  action :install
end

yum_package 'htop' do
  version '1.0.1-2.el6'
  allow_downgrade true
  action :install
end

yum_package 'iftop' do
  version '1.0-0.7.pre4.el6'
  allow_downgrade true
  action :install
end

yum_package 'lsof' do
  version '4.82-4.el6'
  allow_downgrade true
  action :install
end

yum_package 'mailx' do
  version '12.4-7.el6'
  allow_downgrade true
  action :install
end

yum_package 'mlocate' do
  version '0.22.2-4.el6'
  allow_downgrade true
  action :install
end

yum_package 'multitail' do
  version '6.2.1-1.el6'
  allow_downgrade true
  action :install
end

yum_package 'nano' do
  version '2.0.9-7.el6'
  allow_downgrade true
  action :install
end

yum_package 'nc' do
  version '1.84-22.el6'
  allow_downgrade true
  action :install
end

yum_package 'sysstat' do
  version '9.0.4-27.el6'
  allow_downgrade true
  action :install
end

yum_package 'telnet' do
  version '0.17-48.el6'
  allow_downgrade true
  action :install
end

yum_package 'tmux' do
  version '1.6-3.el6'
  allow_downgrade true
  action :install
end

yum_package 'traceroute' do
  version '2.0.14-2.el6'
  allow_downgrade true
  action :install
end

yum_package 'vim' do
  version '7.2.411-1.8.el6'
  allow_downgrade true
  action :install
end

yum_package 'wget' do
  version '1.12-5.el6'
  allow_downgrade true
  action :install
end

yum_package 'zip' do
  version '3.0-1.el6'
  allow_downgrade true
  action :install
end

yum_package 'zsh' do
  version '4.3.10-7.el6'
  allow_downgrade true
  action :install
end

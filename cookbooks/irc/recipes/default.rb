#
# Cookbook Name:: irc
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user 'tdi' do
  action [:remove, :create]
  comment 'Test Driven Infrastructure'
  home '/Users/tdi'
  gid 'staff'
  uid 1234
  shell '/bin/bash'
  system false
  supports :manage_home => true
end

macports_package 'irssi +universal' do
  action :install
end

directory '/Users/tdi/.irssi' do
  owner "tdi"
  group "staff"
end

cookbook_file '/Users/tdi/.irssi/config' do
  source 'irssi-config'
  owner "tdi"
  group "staff"
end

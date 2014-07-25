#
# Cookbook Name:: consul
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/usr/local/bin/consul" do
  source "consul"
  owner "root"
  group "root"
  mode 00755
end



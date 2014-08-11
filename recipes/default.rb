#
# Cookbook Name:: consul
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
package "curl"

cookbook_file "/usr/local/bin/consul" do
  source "consul"
  owner "root"
  group "root"
  mode 00755
end

template "/etc/init/consul.conf" do
  source "consul.conf"
  notifies :stop, "service[consul]", :immediately
  notifies :start, "service[consul]", :immediately
end

service "consul" do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end

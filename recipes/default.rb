#
# Cookbook Name:: echo
# Recipe:: default
#
# Copyright 2015, Goldver
#
# All rights reserved - Do Not Redistribute
#

# Creates destination Directory on User Desktop
directory "#{node['echo']['path']}" do
  action :create
end

# ruby_block "Creates dir on Desktop and on VDI" do
    # block do
        # FileUtils.mkdir_p node['echo']['path']
    # end
# end

#include_recipe "echo::personalno"
include_recipe "echo::year2016"
include_recipe "echo::albac"
include_recipe "echo::sorokina"
include_recipe "echo::exit"
include_recipe "echo::tochka"

include_recipe "echo::vsetak"
include_recipe "echo::Diletanti"
include_recipe "echo::naukafokus"
include_recipe "echo::netak"
include_recipe "echo::svoi-glaza"
include_recipe "echo::victory"
include_recipe "echo::cenapobedy"
include_recipe "echo::48minut"
include_recipe "echo::klinch"

###################################################


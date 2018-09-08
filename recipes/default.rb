#
# Cookbook Name:: echo
# Recipe:: default
#
# Copyright 2015, Goldver
#
# All rights reserved - Do Not Redistribute
#

# Creates destination Directory on User Desktop
directory node['echo']['path'] do
  action :create
end

# ruby_block "Creates dir on Desktop and on VDI" do
    # block do
        # FileUtils.mkdir_p node['echo']['path']
    # end
# end

include_recipe "echo::observation"
# include_recipe "echo::personalno"
# include_recipe "echo::albac"
# include_recipe "echo::sorokina"
# include_recipe "echo::tochka"
# include_recipe "echo::vsetak"
# include_recipe "echo::diletanti"
# include_recipe "echo::netak"
# include_recipe "echo::victory"
# include_recipe "echo::cenapobedy"
# include_recipe "echo::48minut"
# include_recipe "echo::96_pages"
# include_recipe "echo::vsetakplus"
# include_recipe "echo::sut"
# include_recipe "echo::code"

###################################################


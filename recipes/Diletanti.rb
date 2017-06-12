#
# Cookbook Name:: echo
# Recipe:: default
#
# Copyright 2015, Goldver
#
# All rights reserved - Do Not Redistribute
#
cyrTitle = /— Дилетанты/

program = 'Diletanti/'
mypath = node['echo']['path']

require "net/http"
require "uri"
proxy = URI.parse(node['echo']['proxy'])
uri = URI.parse("#{node['echo']['source']}#{program}")
http = Net::HTTP.new(uri.host,uri.port, proxy.host, proxy.port)
response = http.request(Net::HTTP::Get.new(uri.request_uri))
response.code

Chef::Log.info "#### #{response.code} ####"

if (response.code != "200")
	Chef::Log.error  "### Connection failed ###"
	return
end
body = response.read_body

# puts source
tmp = body.split("\n")
tmp = tmp.grep(/.mp3/)[0]
file = tmp.split(/"/)[1]

# puts title in Cirillyc
tmp = body.split("\n")
strFirst = /http?:\/\/echo.msk.ru\/programs\/#{program}/
strLast = /-echo/
tmpFirst = tmp.grep(strFirst) 
tmpLast = tmpFirst.grep(strLast)[0]
# Latinic row
title = tmpLast.split(/e="/)[1]

tmp = title.force_encoding("ISO-8859-1").encode("UTF-8")
title = tmp.encode('ISO8859-1').force_encoding('UTF-8')

Chef::Log.info "##### The title is: #{title} ############"

file_name = title.split(cyrTitle)[0]
file_name = file_name.gsub(/[?:">]/, "")
file_name = file_name.gsub(/\s+/, ' ')
file_name = file_name.strip

Chef::Log.info "##### The file_name is: #{file_name} ############"

src = "#{file}"
Chef::Log.info "##### The src is: #{src} ############"

remote_file "#{mypath}#{file_name}.mp3" do
  source src
  action :create
  not_if {File.exist?("#{mypath}#{file_name} + .mp3")}
  ignore_failure true
end

if node['echo']['arcPath'] == nil
# Do nothing
else
	folder = "Дилетанты/"
	arcPath = "#{node['echo']['arcPath']}#{folder}"

	remote_file "#{arcPath}#{file_name}.mp3" do
	  source src
	  action :create
	  not_if {File.exist?("#{arcPath}#{file_name}.mp3")}
	  ignore_failure true
	end
end






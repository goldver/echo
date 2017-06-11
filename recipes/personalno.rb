#
# Cookbook Name:: echo
# Recipe:: default
#
# Copyright 2015, Goldver
#
# All rights reserved - Do Not Redistribute
#
program = 'personalno/'
path = "C:/Users/MCOMP/Desktop/Radio/"
cirTitle = /мнение/

require "net/http"
require "uri"
proxy = URI.parse(node['echo']['proxy']) 
uri = URI.parse("#{node['echo']['source']}#{program}")
http = Net::HTTP.new(uri.host,uri.port, proxy.host, proxy.port)
response = http.request(Net::HTTP::Get.new(uri.request_uri))
response.code
body = response.read_body

tmp = body.split("\n")
tmp = tmp.grep(/.mp3/)
tmp = tmp.grep(/osoboe/)

urls = Array.new 
tmp.each do |c|
	startHttp = c.split('a href="')[1]
	endHttp = startHttp.split('" c')[0]
	urls.push(endHttp)
end

tmp = body.split("\n")
strFirst = /http?:\/\/echo.msk.ru\/programs\/#{program}/
strLast = /-echo\/" data-title="/
tmpFirst = tmp.grep(strFirst) 
tmpLast = tmpFirst.grep(strLast)

cirTitleArr = Array.new 
tmpLast.each do |c|
	startTitle = c.split(/e="/)[1]
	endTitle = startTitle.split('">')[0]
	cirTitleArr.push(endTitle)
end

cirDivTitle = Array.new 
cirTitleArr.each do |c|
	######
	c = c.force_encoding("ISO-8859-1").encode("UTF-8")
	c = c.encode('ISO8859-1').force_encoding('UTF-8')
	######
	file_name = c.split(cirTitle)[0]
	file_name = file_name.gsub(/[?:">]/, "")
	file_name = file_name.strip
	cirDivTitle.push(file_name)
end

len = urls.length
i=0
while (i < len) do
	remote_file "#{path}#{cirDivTitle[i]}.mp3" do
		source urls[i]
		action :create
		not_if {File.exists?("#{path}#{cirDivTitle[i]}.mp3")}
		ignore_failure true
	end
	i = i + 1
end







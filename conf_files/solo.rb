root = File.absolute_path(File.dirname(__FILE__))
verify_api_cert true
file_cache_path root
cookbook_path [root + '/cookbooks', root + '/site-cookbooks']
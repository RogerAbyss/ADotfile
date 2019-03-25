require "yaml"

gemList = YAML.load_file(File.dirname(File.dirname(__FILE__))+'/config/gem.yml')

puts "\033[32m gem 升级 \033[0m"
system "gem update --system"
puts gemList
for item in gemList
    system "gem install #{item}"
end
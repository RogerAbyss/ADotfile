require "yaml"

puts "\033[32m \n
==============================
    ADotfiles - 开始手动装机
==============================
\n \033[0m"

puts "\033[32m 1.你需要安装java jre环境:\nbrew cask install java\n \033[0m"
puts "\033[32m 2.下载vscode, chrome浏览器同步插件和书签:\nhttps://code.visualstudio.com/\n \033[0m"
puts "\033[32m 3.从lastpass获取token, 从插件sync下载配置, 搜code配置命令行 \033[0m"
puts "\033[32m 4.安装zsh命令行(./home), ssh自己备份过来 \033[0m"
puts "\033[32m 5.nginx配置 \033[0m"
puts "\033[32m 6.允许任何来源,安装一些软件(./crash):\nsudo spctl --master-disable\n \033[0m"


puts "\033[32m 在手动的同时, 以下安装有可能出错, 如有问题请自行安装 \033[0m"
config = YAML.load_file(File.dirname(__FILE__)+'/config/config.yml')
gemList = YAML.load_file(File.dirname(__FILE__)+'/config/gem.yml')
if gemList.length > 0
    gpg = config['ruby']['gpg']
    ruby_version = config['ruby']['version']

    puts "\033[32m rvm 安装 \033[0m"
    system "curl -sSL https://rvm.io/mpapis.asc | gpg --import -"
    system "curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -"
    gpg_c = "gpg --keyserver #{gpg} --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB"
    system gpg_c
    puts gpg_c
    rvm_c = "curl -sSL https://get.rvm.io | bash -s stable --ruby"
    puts rvm_c
    system rvm_c
    system "source ~/.rvm/scripts/rvm"
    system "rvm use #{ruby_version} --default"

    if [ -f "~/.rvm/gems/ruby-#{ruby_version}" ]
        then
            puts "\033[32m gem 升级 \033[0m"
            system "gem update --system"
            puts gemList
            for item in gemList
                system "gem install #{item}"
            end
        else
            puts "stable变更, 请自行安装"
    fi
end
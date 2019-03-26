require "yaml"

puts "\033[32m \n
==============================
    ADotfiles - Mac一键装机
==============================
\n \033[0m"

 system "cp -af macos/home/ ~/"
 system "ls -a ~/"

 puts "\033[32m 请确认转移对应的ssh秘钥文件 \033[0m"
 if ARGV[0] != "travis"
     puts "\033[32m 开始设置系统 \033[0m"
     system "sh ./macos/macos.sh"
 end

 config = YAML.load_file(File.dirname(File.dirname(__FILE__))+'/config/config.yml')
 if config["proxy"].length > 0
     puts config["proxy"]
     puts "\033[32m 使用代理#{config['proxy']} \033[0m"
     system "exports export http_proxy=#{config['proxy']}"
     system "exports export https_proxy=#{config['proxy']}"
 end

 puts "\033[32m 安装Homebrew并升级到最新 \033[0m"
 system '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
 system 'brew update'
 system 'brew upgrade'

 puts "\033[32m brew install \033[0m"
 brewList = YAML.load_file(File.dirname(File.dirname(__FILE__))+'/config/brew.yml')
 puts brewList
 for item in brewList
     system "brew install #{item}"
 end

 puts "\033[32m brew cask install \033[0m"
 caskList = YAML.load_file(File.dirname(File.dirname(__FILE__))+'/config/cask.yml')
 puts caskList
 for item in caskList
     system "brew cask install #{item}"
 end

 puts "\033[32m 清理缓存 \033[0m"
 system 'brew cleanup'

 puts "\033[32m 设置git#{config['git']} \033[0m"
 system "git config --global user.name #{config['git']['username']}"
 system "git config --global user.email=#{config['git']['email']}"

 npmList = YAML.load_file(File.dirname(File.dirname(__FILE__))+'/config/npm.yml')
 if npmList.length > 0
     puts "\033[32m nvm 安装 \033[0m"
     system "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
     "
     system "nvm install stable"
     system "npm install -g npm"

     puts npmList
     for item in npmList
         system "npm install -g #{item}"
     end
 end

 condaList = YAML.load_file(File.dirname(File.dirname(__FILE__))+'/config/conda.yml')
 if condaList.length > 0
     puts "\033[32m anaconda 安装 \033[0m"
     system "brew cask install anaconda"
    
     puts condaList
     for item in condaList
         system "conda install #{item}"
     end
 end

 if ARGV[0] != "travis"
     gitMap = YAML.load_file(File.dirname(File.dirname(__FILE__))+'/config/git.yml')
     system "mkdir projects"
     gitMap.each{|key, list|
         system "cd projects&&mkdir #{key}"
         for item in list
             system "cd projects/#{key}&&git clone #{item}"
         end
     }
 end

 system "ruby ./macos/installer.rb #{ARGV[0]}"

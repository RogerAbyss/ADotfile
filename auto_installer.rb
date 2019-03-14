require "yaml"

puts "\033[32m \n
==============================
    ADotfiles - Mac一键装机
==============================
\n \033[0m"

# puts "\033[32m 请确认转移对应的ssh秘钥, 之后会开始自动下载git项目 \033[0m"
# config = YAML.load_file(File.dirname(__FILE__)+'/config/config.yml')
# if config["proxy"].length > 0
#     puts config["proxy"]
#     puts "\033[32m 使用代理#{config['proxy']} \033[0m"
#     system "exports export http_proxy=#{config['proxy']}"
#     system "exports export https_proxy=#{config['proxy']}"
# end

# puts "\033[32m 安装Homebrew并升级到最新 \033[0m"
# system '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
# system 'brew update'
# system 'brew upgrade'

# puts "\033[32m brew install \033[0m"
# brewList = YAML.load_file(File.dirname(__FILE__)+'/config/brew.yml')
# puts brewList
# for item in brewList
#     system "brew install #{item}"
# end

# puts "\033[32m brew cask install \033[0m"
# caskList = YAML.load_file(File.dirname(__FILE__)+'/config/cask.yml')
# puts caskList
# for item in caskList
#     system "brew cask install #{item}"
# end

# puts "\033[32m 清理缓存 \033[0m"
# system 'brew cleanup'

# puts "\033[32m 设置git#{config['git']} \033[0m"
# system "git config --global user.name #{config['git']['username']}"
# system "git config --global user.email=#{config['git']['email']}"

# npmList = YAML.load_file(File.dirname(__FILE__)+'/config/npm.yml')
# if npmList.length > 0
#     puts "\033[32m nvm 安装 \033[0m"
#     system "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
#     "
#     system "nvm install stable"
#     system "npm install -g npm"

#     puts npmList
#     for item in npmList
#         system "npm install -g #{item}"
#     end
# end

gemList = YAML.load_file(File.dirname(__FILE__)+'/config/gem.yml')
if gemList.length > 0
    puts "\033[32m rvm 安装 \033[0m"
    system "brew install "
    system "curl -sSL https://rvm.io/mpapis.asc | gpg --import -"
    system "curl -sSL https://get.rvm.io | bash -s stable"
    system "rvm use default"
    puts "\033[32m gem 升级 \033[0m"
    system "gem update --system"

    # puts gemList
    # for item in gemList
    #     system "gem install #{item}"
    # end
end

# condaList = YAML.load_file(File.dirname(__FILE__)+'/config/conda.yml')
# if condaList.length > 0
#     puts "\033[32m anaconda 安装 \033[0m"
#     system "brew cask install anaconda"
    
#     puts condaList
#     for item in condaList
#         system "conda install #{item}"
#     end
# end

# zshList = YAML.load_file(File.dirname(__FILE__)+'/config/zsh.yml')
# puts "\033[32m oh-my-zsh 安装 \033[0m"
# system "sh -c '$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)'"
# for item in zshList
#     system "cd zsh&&git clone #{item}"
# end

# gitMap = YAML.load_file(File.dirname(__FILE__)+'/config/git.yml')
# system "mkdir projects"
# gitMap.each{|key, list|
#     system "cd projects&&mkdir #{key}"
#     for item in list
#         system "cd projects/#{key}&&git clone #{item}"
#     end
# }

# system "ruby ./installer.rb"
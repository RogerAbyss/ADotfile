# Cocoapods
    中心化的三方库管理工具, 使用广泛

### Podfile
plese see ``utils/run/cocoapods``

### MAN

* ``pod update``: first init project
* ``pod install --no-repo-update``: commom install

### Suggestion

```zsh
# make alias in .zshrc
# pod commom
alias podupda='pod update --verbose --no-repo-update'
alias podinst='pod install --verbose --no-repo-update'
# pod repo/lib
alias podpush='pod repo push AbyssRepo --verbose --allow-warnings --sources=AbyssRepo,master'
alias podlint='pod lib lint --verbose --allow-warnings --sources=AbyssRepo,master'
# git
alias gitfile='git log --pretty=oneline --graph'
```

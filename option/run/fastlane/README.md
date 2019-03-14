fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios test
```
fastlane ios test
```
测试版,上传Fir
### ios beta
```
fastlane ios beta
```
预发布版(测试正式环境),上传Fir
### ios release
```
fastlane ios release
```
正式服(使用前请自行处理好所有的git事务, 选择发布的分支), 上传AppStore
### ios refresh
```
fastlane ios refresh
```
刷新证书, 如果失败请于管理员联系
### ios setting
```
fastlane ios setting
```
设置证书(非管理员, 请不要使用此功能)
### ios devices
```
fastlane ios devices
```
增加设备, 注意到开发者中心证书添加并且刷新本地使用证书

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).

# README

```
Commom README.md for project

Follow README.md you will find best practice
run ios project.Only CocoaPods & Carthage is
required, Others is optional.You can read 
feature to choose whether use it and find 
config in utils/run.

If you think this is helpful for you, please 
star Github:https://github.com/RogerAbyss

Copyright@2018
Version:swift@4.1 
Author: Abyss
Contact: roger_ren@qq.com
```

## About
* [CocoaPods](readme/cocoapods.md)
* [Carthage](readme/carthage.md)
* [Project](readme/project.md)
* [Privacy](readme/privacy.md)
* [Fabric](readme/fabric.md)
* [Npm](readme/npm.md)
* [Fastlane](readme/fastlane.md)
* [Jazzy](readme/jazzy.md)

## Install

add utils to project and add code:
```AppDelegate.m
        /**
         执行插件
        */
        Plugin.shared.plugins.forEach {
            ($0.application(application, didFinishLaunchingWithOptions: launchOptions))
        }
```

## Optional

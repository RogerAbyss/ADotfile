//
//  Plugin.swift
//  zgxlSwift
//
//  Created by 任超 on 2018/1/18.
//  Copyright © 2018年 Chongqing Xilian Technology Development Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

open class Plugin
{
    /** 插件列表 */
    var plugins: [PluginService]
    
    /** 单例 */
    static let shared = Plugin()
    
    private init(){
        self.plugins = [PluginDebug(),PluginPush()]
    }
        
    /** 添加插件 */
    func add(_ plugin: PluginService) {
        plugins.append(plugin)
    }
}


/**
 # 插件管理器
 ```
 插件可以实现管理以下事件
 ```
 */
public protocol PluginService {
    /**
     进入App
    */
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
    
    /**
     App即将被挂机, 暂停执行
     */
    func applicationWillResignActive(_ application: UIApplication)
    
    /**
     App进入后台
     */
    func applicationDidEnterBackground(_ application: UIApplication)
    
    /**
     App即将进入前台
     */
    func applicationWillEnterForeground(_ application: UIApplication)
    
    /**
     App进入激活状态
     */
    func applicationDidBecomeActive(_ application: UIApplication)
    
    /**
     App将结束(包括后台保持太久被杀死, 但此情况不是一定会进入)
     */
    func applicationWillTerminate(_ application: UIApplication)
}

/**
 ## 插件管理器的默认实现
 */
public extension PluginService {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {}
    
    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
}

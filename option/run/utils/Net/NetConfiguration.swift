//
//  NetConfiguration.swift
//  VirtualCoins
//
//  Created by 任超 on 2018/4/25.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import Foundation

public struct NetConfiguration {
    public static let host = "http://tan2.test.rewang.cn/"
    public static let timeout = 15.0
    public static func publicHeader() -> [String: String] {
        return [:]
    }
}

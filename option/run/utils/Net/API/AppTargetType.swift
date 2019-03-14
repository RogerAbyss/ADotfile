//
//  AppTargetType.swift
//  zgxlSwift
//
//  Created by 任超 on 2018/1/23.
//  Copyright © 2018年 Chongqing Xilian Technology Development Co., Ltd. All rights reserved.
//

import Foundation
import Moya

public protocol AppTargetType : TargetType {
    var codeKey: String { get }
}

extension AppTargetType {
    public var codeKey: String { return "ResultCode" }
}

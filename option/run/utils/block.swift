//
//  block.swift
//  VirtualCoins
//
//  Created by 任超 on 2018/5/12.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import UIKit
import SwiftyJSON

typealias EventCallback = () -> ()
typealias EventJSONCallback = (_ json: JSON) -> ()
typealias EventTagCallback = (_ tag: Int) -> ()
typealias EventSuccessCallback = (_ success: Bool) -> ()
typealias EventStringCallback = (_ str: String) -> ()

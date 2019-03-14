//
//  RefreshControllerConfigration.swift
//  VirtualCoins
//
//  Created by 任超 on 2018/5/8.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import UIKit
import SwifterSwift
import MJRefresh

class RefreshControllerConfigration: NSObject {
    class func setup() {
        RefreshController.setDefualtURLGenerator { (controller, pageIndex, pageSize) -> (Dictionary<String, Any>) in
            return [:]
        }
        
        RefreshController.setDefualtRequest { (controller, selector, byFooter, data) in
            var params = ["PageSize":data["pageSize"],
                          "PageNo":data["pageIndex"]]
            
            params += data["requestParams"] as! [String : Any]
            
            if (data["api"] as! String).count < 1 {
                if let header = (controller.refreshView as! UIScrollView).mj_header {
                    header.state = .idle
                }
            }
            else
            {
                /**
                 列表开始请求
                */
                
                //TODO: 列表请求开始
                
            }
        }
        
        RefreshController.setDefualPreRequest { (_, _, _) -> (Bool) in
            return true
        }
        
        RefreshController.setDefualPostRequest { (_, _, _) in
        }
        
        RefreshController.setDefualtRequestDone { (controller, byFooter, data) in
        }
        
        RefreshController.setDefualtNetDataConvert { (data) -> (Array<Any>) in
            return data["List"]! as! Array
        }
    }
}

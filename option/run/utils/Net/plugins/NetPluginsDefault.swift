//
//  PluginLog.swift
//  zgxlSwift
//
//  Created by 任超 on 2018/1/18.
//  Copyright © 2018年 Chongqing Xilian Technology Development Co., Ltd. All rights reserved.
//

import Foundation
import Moya
import Result
import UIKit
import SwiftyJSON

final class NetPluginsDefault: PluginType {

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        return request
    }
    
    func willSend(_ request: RequestType, target: TargetType) {
        Hud.show()
        print("🚀 请求: \(request.request?.url?.absoluteString ?? "")")
    }
    
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        Hud.hide()
        if case .success(let response) = result {
            let data = JSON(response.data);
            
            if response.isSuccess() {
                print("🥇 收到数据: \(data)")
            } else {
                Hud.show(type: .info, text: String(response.statusCode))
                print("🐛 状态码错误: \(response.statusCode)")
            }
        }
        
        if case .failure(let error) = result {
            print("🐛 请求出错: \(error)")
        }
    }
    
    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
        return result
    }
}

/**
 PluginNetBase对于Reponse的拓展
 ```
 基础插件PluginNetBase对于Reponse的拓展
 ```
 */
extension Response {
    /**
     返回Response是否成功
     实际业务用于判断http请求成功, 但业务不确定是否成功 或者 多业务协同成功的情况
    */
    public func isSuccess() -> Bool {
        return (self.statusCode == 200)
    }
}

//
//  DefaultApi.swift
//  zgxlSwift
//
//  Created by 任超 on 2018/1/17.
//  Copyright © 2018年 Chongqing Xilian Technology Development Co., Ltd. All rights reserved.
//

import Foundation
import Alamofire
import Moya
import SwiftyJSON

public enum AppApiDefault
{
    /** 通用get请求 */
    case get(api: String, params: [String: AnyObject]?)
    /** 通用post请求 */
    case post(api: String, params: [String: AnyObject]?)
}

extension AppApiDefault: AppTargetType
{
    /** 域名 */
    public var baseURL: URL { return URL(string: NetConfiguration.host)! }
    
    /** api: 外部参数 */
    public var path: String {
        switch self
        {
        case let .get(api,_), let .post(api,_):
            return "\(api)"
        }
    }
    
    /** method: get/post */
    public var method: Moya.Method {
        switch self {
        case .get(_):
            return .get
        case .post(_):
            return .post
        }
    }

    /** task: 请求方式 */
    public var task: Moya.Task {
        switch self {
        case let .get(_, params),let .post(_, params):
            if params != nil {
                return .requestParameters(parameters: params!,
                                          encoding: URLEncoding.default)
            } else {
                return .requestPlain
            }
        }
    }
    
    /** headers 请求头 */
    public var headers: [String : String]? {
        return [:]
    }
    
    /** sampleData 用于测试 */
    public var sampleData: Data {
        return Data.init()
    }
    
    /** 是否根据sampleData检验数据: 默认false */
    public var validate: Bool {
        return false
    }
}


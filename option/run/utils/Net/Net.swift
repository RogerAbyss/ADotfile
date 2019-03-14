//
//  Net.swift
//  VirtualCoins
//
//  Created by 任超 on 2018/4/21.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import UIKit
import Alamofire
import Moya
import SwiftyJSON

final class Net<Target> where Target: AppTargetType {
    /** 默认加载器 */
    private let provider: MoyaProvider<Target>
    
    /** 默认返回成功JSON的闭包 */
    typealias JSONClosure = (_ json: JSON, _ data: JSON , _ success: Bool) -> Swift.Void
    
    /**
     Endpoint
     用于添加头文件
     */
    public final class func AppDefaultEndpoint(for target: Target) -> Endpoint {
        return Endpoint(
            url: URL(target: target).absoluteString,
            sampleResponseClosure: { .networkResponse(200, target.sampleData) },
            method: target.method,
            task: target.task,
            httpHeaderFields: target.headers
            ).adding(newHTTPHeaderFields: NetConfiguration.publicHeader())
    }
    
    /**
     AppDefaultRequest
     用于修改超时
     */
    public final class func AppDefaultRequest(for endpoint: Endpoint, closure: MoyaProvider<Target>.RequestResultClosure) {
        do {
            var urlRequest = try endpoint.urlRequest()
            urlRequest.timeoutInterval = NetConfiguration.timeout
            closure(.success(urlRequest))
        } catch MoyaError.requestMapping(let url) {
            closure(.failure(MoyaError.requestMapping(url)))
        } catch MoyaError.parameterEncoding(let error) {
            closure(.failure(MoyaError.parameterEncoding(error)))
        } catch {
            closure(.failure(MoyaError.underlying(error, nil)))
        }
    }
    
    /**
     初始化Provider
     */
    init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = AppDefaultEndpoint,
         requestClosure: @escaping MoyaProvider<Target>.RequestClosure = AppDefaultRequest,
         stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.neverStub,
         manager: Manager = MoyaProvider<Target>.defaultAlamofireManager(),
         plugins: [PluginType] = [NetPluginsDefault()],
         trackInflights: Bool = false) {
        
        self.provider = MoyaProvider(endpointClosure: endpointClosure,
                                     requestClosure: requestClosure,
                                     stubClosure: stubClosure,
                                     manager: manager,
                                     plugins: plugins,
                                     trackInflights: trackInflights)
    }
    
    /**
     自定义请求
     */
    func request(_ target: Target, ifSuccess: @escaping JSONClosure) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                self.process(target, ifSuccess: ifSuccess, response: response)
            case .failure(_):
                break
            }
        }
    }

    func process(_ target: Target, ifSuccess: @escaping JSONClosure, response: Response) {
        
        /**
         NetPluginsDefault插件中判断http请求是否成功
         这里是服务器请求同意
         */
        
        //TODO: 网络请求底层
        /** 正常流程
        let data = JSON(response.data)
        
        if(data[target.codeKey] == 1)
        {
            let data = JSON(response.data)
            
            ifSuccess(data, data["data"] ,data[target.codeKey] == 1)
        }
        else
        {
            Hud.show(type: .info, text: "")
        }
        */
    }
}


class AccessTokenAdapter: RequestAdapter {
    private let accessToken: String
    
    init(accessToken: String) {
        self.accessToken = accessToken
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue(accessToken, forHTTPHeaderField: "Token")
        return urlRequest
    }
}

//
//  RefreshController.swift
//  VirtualCoins
//
//  Created by 任超 on 2018/5/8.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import UIKit
import MJRefresh
import SwiftyJSON

/**
 生成请求参数
 */
typealias RefreshURLGenerator = (_ refreshName: String,_ pageIndex: Int,_ pageSize: Int) -> (Dictionary<String, Any>)

typealias RefreshNetDataConvert = (_ data: Dictionary<String, Any>) -> (Array<Any>)
typealias RefreshRequest = (_ controller: RefreshController, _ Selector: Selector, _ byFooter: Bool, _ refreshData: Dictionary<String, Any>) -> ()
typealias RefreshRequestDone = (_ controller: RefreshController, _ byFooter: Bool, _ data: Dictionary<String, Any>) -> ()

typealias RefreshPreRequest = (_ controller: RefreshController, _ byFooter: Bool, _ arguments: Any) -> (Bool)
typealias RefreshPostRequest = (_ controller: RefreshController, _ byFooter: Bool, _ arguments: Any) -> ()

class RefreshController: NSObject {
    var refreshName: String!
    var refreshView: AnyObject!
    
    var refreshData: [Any]! = []
    
    var pageIndex: Int = 0
    var pageSize: Int = 10
    var dataDone: Bool = false
    
    var loading: Bool = false
    
    
    static var s_urlGeneratorBlock: RefreshURLGenerator?
    var urlGeneratorBlock :RefreshURLGenerator = s_urlGeneratorBlock!
    
    static var s_netDataConvertBlock: RefreshNetDataConvert?
    var netDataConvertBlock :RefreshNetDataConvert = s_netDataConvertBlock!

    static var s_requestBlock: RefreshRequest?
    var requestBlock :RefreshRequest = s_requestBlock!

    static var s_requestDoneBlock: RefreshRequestDone?
    var requestDoneBlock :RefreshRequestDone = s_requestDoneBlock!

    static var s_preRequestBlock: RefreshPreRequest?
    var preRequestBlock :RefreshPreRequest = s_preRequestBlock!

    static var s_postRequestBlock: RefreshPostRequest?
    var postRequestBlock :RefreshPostRequest = s_postRequestBlock!
    
    init(_ refreshName: String!,refreshView: AnyObject!) {
        self.refreshName = refreshName
        self.refreshView = refreshView
        
        if self.refreshView.isKind(of: UIScrollView.classForCoder()) {
            (self.refreshView as! UIScrollView).showsVerticalScrollIndicator = false
            (self.refreshView as! UIScrollView).showsHorizontalScrollIndicator = false
        }
        
        if self.refreshView.isKind(of: UITableView.classForCoder()) {
            (self.refreshView as! UITableView).separatorStyle = .none
        }
    }
}

extension RefreshController {
    public func requestData(_ byFooter: Bool) {
        if (byFooter) {
            if(self.dataDone)
            {
                if let footer = (self.refreshView as! UIScrollView).mj_footer {
                    footer.state = .noMoreData
                }
                return ;
            }
        }
        else
        {
            self.dataDone = false
        }
        
        self.pageIndex = byFooter ? self.refreshData.count/self.pageSize : 0;
        
        let params = [
            "requestParams":self.urlGeneratorBlock(self.refreshName,self.pageIndex,self.pageSize),
            "pageIndex":String(self.pageIndex),
            "pageSize":String(self.pageSize),
            "api":self.refreshName
            ] as [String : Any]
        
        let handler = byFooter ? #selector(self.footRequestHandler) :  #selector(self.headRequestHandler)
        if (!loading) {
            self.requestBlock(self, handler, byFooter, params)
            loading = true
        }
    }
    
    public func requestDataDone(_ data: Dictionary<String, Any>, _ byFooter: Bool) {
        
        loading = false
        if !self.preRequestBlock(self, byFooter, data)
        {
            self.requestDoneBlock(self, byFooter, data)
            return
        }
        
        let pageData = self.netDataConvertBlock(data)
        self.dataDone = (pageData.count == 0)
        
        if (!byFooter) {
            self.refreshData.removeAll()
        }
        
        if let header = (self.refreshView as! UIScrollView).mj_header {
            header.state = .idle
        }
        if let footer = (self.refreshView as! UIScrollView).mj_footer {
            footer.state = .idle
        }
        
        if(!self.dataDone) {
            self.refreshData = self.refreshData + pageData
        }
        
        if (pageData.count < self.pageSize) {
            self.dataDone = true
        }
        
        if self.dataDone {
            if let footer = (self.refreshView as! UIScrollView).mj_footer {
                footer.state = .noMoreData
            }
        }
        
        (self.refreshView as! UITableView).reloadData()
        
        self.postRequestBlock(self, byFooter, data)
        self.requestDoneBlock(self, byFooter, data)
    }
}

extension RefreshController {
    class func setDefualtURLGenerator(_ callback: RefreshURLGenerator!) {
        s_urlGeneratorBlock = callback
    }
    class func setDefualtNetDataConvert(_ callback: RefreshNetDataConvert!) {
        s_netDataConvertBlock = callback
    }
    class func setDefualtRequest(_ callback: RefreshRequest!) {
        s_requestBlock = callback
    }
    class func setDefualtRequestDone(_ callback: RefreshRequestDone!) {
        s_requestDoneBlock = callback
    }
    class func setDefualPreRequest(_ callback: RefreshPreRequest!) {
        s_preRequestBlock = callback
    }
    class func setDefualPostRequest(_ callback: RefreshPostRequest!) {
        s_postRequestBlock = callback
    }
}

extension RefreshController {
    
    public func refreshWithLoading() {
        self.requestData(false)
    }
    
    public func addHeader() {
        (self.refreshView as! UIScrollView).mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.requestData(false)
        })
    }
    
    public func addFooter() {
        (self.refreshView as! UIScrollView).mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            self.requestData(true)
        })
    }
    
    @objc public func headRequestHandler(_ data: Dictionary<String, Any>) {
        self.requestDataDone(data, false)
    }
    
    @objc public func footRequestHandler(_ data: Dictionary<String, Any>) {
        self.requestDataDone(data, true)
    }
}

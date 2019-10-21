//
//  XJWKWebViewBridge.swift
//  TradeMark
//
//  Created by JingXueLong on 2019/10/15.
//  Copyright © 2019 北京梦知网科技有限公司. All rights reserved.
//

import UIKit
import WebKit

typealias BackHandel = (NSDictionary?,String) ->Void
class XJWKWebViewBridge: NSObject,WKScriptMessageHandler {
    
    var handleArray: [String:BackHandel] = [:]
    
    weak var webView: WKWebView?
    init(webView: WKWebView) {
        self.webView = webView
    }
    
    func registJSfunc(name: String, backHandel: @escaping BackHandel){
        self.webView?.configuration.userContentController.add(self, name: name)
        handleArray[name] = backHandel
    }
    
    func removeJSfunc(name: String){
        self.webView?.configuration.userContentController.removeScriptMessageHandler(forName: name)
        handleArray[name] = nil
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let handel =  handleArray[message.name] {
            if let strmessage = message.body as? String{
                if let data = strmessage.data(using: .utf8){
                    do {
                        let messageDic = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                        handel(messageDic as? NSDictionary, message.name)
                    } catch {
                        handel(nil, message.name)
                    }
                }
            }
        }
    }
    
}

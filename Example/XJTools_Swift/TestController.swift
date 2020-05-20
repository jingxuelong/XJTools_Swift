//
//  TestController.swift
//  XJTools_Swift_Example
//
//  Created by JingXueLong on 2020/1/2.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import WebKit

class TestController: BaseSwiftController{
    
    override var titleName: String? {"Test"}
    
//    override var needNavView: Bool{true}
    
    override var needBackBtn: Bool{true} //默认needNavView
    
    var webView = { () -> WKWebView in
        let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        webView.backgroundColor = .white
        return webView
    }()
    var wbBridge: XJWKWebViewBridge!

    
    var tableView: UITableView = BaseSwiftController.ClassGetNormalTableView(frame: .init(origin: .zero, size: .init(width: k_XJScreenWide_S, height: k_XJScreenHeight_S)))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置所有适配值返回模式  CGFloat 向上取整 向下取整 不作操作（可能小数很长某些试图出现特殊线问题） 默认floor模式
        currentValuesMode = .floor
        
        
        //根据屏幕宽度自适应值 基准iPhone6  wide 375   CGFloat
        let wide = 40.XJWide
        let wide1 = XJAutoWideValue(40) //等效
        print("wide = ", wide,"wide1 = ",wide1)
        
        //如果是全屏幕系列自动增加 20  ，在适配值基础上   CGFloat
        let height = 40.XJWideIphoneXAdd(20)
        let height1 = XJAutoWideValue(40, iphoneXAdd: 20) //等效
        print("height = ", height, "height1 = ",height1)

        
        //平方字体
        let font = XJFontPingSC_Regular(20)
        let font1 = XJFontPingSC_Medium(20)
                
        
        ///初始化
        wbBridge = XJWKWebViewBridge(webView: webView)
        
        ///注册和回调
        wbBridge.registJSfunc(name: "uploadx") {(message, name) in
            
        }
        
        
        
    }
    
    
    ///返回事件可重写
    override func back() {
        super.back()
    }

}

//
//  SomeView.swift
//  
//  XJTools_Swift
//  Created by JingXueLong.
//  Copyright © 2018 JingXueLong. All rights reserved.
//


import Foundation
import UIKit


/// 设置是适配值模式  default floor 小数向下取整 32.11 = 32.0   none 不取整  ceil 向上取整
public enum XJValuesMode {
    case ceil
    case floor
    case none
}

public var currentValuesMode: XJValuesMode = .floor

//常量
public let k_XJScreenWide_S: CGFloat = UIScreen.main.bounds.size.width

public let k_XJScreenHeight_S: CGFloat = UIScreen.main.bounds.size.height

public let k_XJStatusBarHeight_S: CGFloat = is_XJIphoneWithSafeArea_S ? 44.0 : 20.0

public let k_XJNavHeight_S: CGFloat = 44.0

public let k_XJNavAndStatusHeight_S: CGFloat = k_XJStatusBarHeight_S + k_XJNavHeight_S

public let k_XJTabbarHeight_S: CGFloat = 49.0

public let k_XJTabbarSafeAreaHeight_S: CGFloat = is_XJIphoneWithSafeArea_S ? 34.0:0.0

public let k_XJTabbarAndSafeAreaHeight_S: CGFloat = k_XJTabbarHeight_S + k_XJTabbarSafeAreaHeight_S

public let k_pixWide_S: CGFloat = (1.0/UIScreen.main.scale)

public let k_XJWideScale_S: CGFloat = UIScreen.main.bounds.width/375.0

//bool判断
public var  is_XJIphone_S: Bool {get{
    return UIDevice.current.userInterfaceIdiom == .phone}
}

public let  is_XJIphoneWithSafeArea_S: Bool = getIs_XJIphoneWithSafeArea()


///适配值  Replace by  20.XJWide
public func XJAutoWideValue(_ value: CGFloat, iphoneXAdd: CGFloat = 0) -> CGFloat {
    let needAdd: CGFloat = is_XJIphoneWithSafeArea_S ? CGFloat(iphoneXAdd) * k_XJWideScale_S : 0.0
    return getValueChangeFunc()(CGFloat(value) * k_XJWideScale_S + needAdd)
}
public func XJAutoWideValue(_ value: Int, iphoneXAdd: Int = 0) -> CGFloat {
    let needAdd: CGFloat = is_XJIphoneWithSafeArea_S ? CGFloat(iphoneXAdd) * k_XJWideScale_S : 0.0
    return getValueChangeFunc()(CGFloat(value) * k_XJWideScale_S + needAdd)
}
public func XJAutoWideValue(_ value: Double, iphoneXAdd: Double = 0) -> CGFloat {
    let needAdd: CGFloat = is_XJIphoneWithSafeArea_S ? CGFloat(iphoneXAdd) * k_XJWideScale_S : 0.0
    return getValueChangeFunc()(CGFloat(value) * k_XJWideScale_S + needAdd)
}

/**
    苹方-简 常规体
 　　font-family: PingFangSC-Regular, sans-serif;
*/
public func XJFontPingSC_Regular(_ fontsize: Int) -> UIFont{
    UIFont(name: "PingFangSC-Regular", size: CGFloat(fontsize)) ?? UIFont.systemFont(ofSize: CGFloat(fontsize))
}

/**
    苹方-简 中黑体
    font-family: PingFangSC-Medium, sans-serif;
*/
public func XJFontPingSC_Medium(_ fontsize: Int) -> UIFont{
    UIFont(name: "PingFangSC-Medium", size: CGFloat(fontsize)) ?? UIFont.systemFont(ofSize: CGFloat(fontsize))
}

/** 　　苹方-简 中粗体
　　font-family: PingFangSC-Semibold, sans-serif;
*/
public func XJFontPingSC_Semibold(_ fontsize: Int) -> UIFont{
    UIFont(name: "PingFangSC-Semibold", size: CGFloat(fontsize)) ?? UIFont.systemFont(ofSize: CGFloat(fontsize))
}
/**
    苹方-简 纤细体
    font-family: PingFangSC-Thin, sans-serif;
*/
public func XJFontPingSC_Thin(_ fontsize: Int) -> UIFont{
    UIFont(name: "PingFangSC-Thin", size: CGFloat(fontsize)) ?? UIFont.systemFont(ofSize: CGFloat(fontsize))
}
/**
    苹方-简 细体
    font-family: PingFangSC-Light, sans-serif;
*/
public func XJFontPingSC_Light(_ fontsize: Int) -> UIFont{
    UIFont(name: "PingFangSC-Light", size: CGFloat(fontsize)) ?? UIFont.systemFont(ofSize: CGFloat(fontsize))
}
/**
    苹方-简 极细体
    font-family: PingFangSC-Ultralight, sans-serif;
*/
public func XJFontPingSC_Ultralight(_ fontsize: Int) -> UIFont{
    UIFont(name: "PingFangSC-Ultralight", size: CGFloat(fontsize)) ?? UIFont.systemFont(ofSize: CGFloat(fontsize))
}


//执行一次
fileprivate func getIs_XJIphoneWithSafeArea() -> Bool{
    if is_XJIphone_S , #available(iOS 11.0,  * ){
        var bottom = 0.0
        if let window = UIApplication.shared.delegate?.window, let innerWindow = window {
            bottom = Double(innerWindow.safeAreaInsets.bottom)
        }else{
            let window = UIWindow(frame: UIScreen.main.bounds)
            bottom = Double(window.safeAreaInsets.bottom)
        }
        if bottom > 0.0  {
            return true
        }
    }
    return false
}


func getValueChangeFunc() -> (CGFloat) -> CGFloat {
    func nonefunc(value: CGFloat) -> CGFloat{
        return CGFloat(value)
    }
    func floorfunc(value: CGFloat) -> CGFloat{
        return CGFloat(floor(value))
    }
    func ceilfunc(value: CGFloat) -> CGFloat{
        return CGFloat(ceil(value))
    }
    switch currentValuesMode {
    case .none:
        return nonefunc(value:)
    case .ceil:
        return ceilfunc(value:)
    case .floor:
        return floorfunc(value:)
    }
    
}


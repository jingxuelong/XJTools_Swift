//
//  File.swift
//  XJ_Imiayu_Project
//
//  Copyright © 2019 XJ. All rights reserved.
//

import Foundation

//常量

var k_XJScreenWide_S: CGFloat{
    return UIScreen.main.bounds.size.width
}
var k_XJScreenHeight_S: CGFloat{
    return UIScreen.main.bounds.size.height
}
var k_XJStatusBarHeight_S: CGFloat{
    return is_XJIphoneWithSafeArea_S ? 44.0:20.0
}
var k_XJNavHeight_S: CGFloat{
    return 44.0
}
var k_XJNavAndStatusHeight_S: CGFloat{
    return k_XJStatusBarHeight_S+k_XJNavHeight_S
}
var k_XJTabbarHeight_S: CGFloat{
    return 49.0
}
var k_XJTabbarSafeAreaHeight_S: CGFloat{
    return is_XJIphoneWithSafeArea_S ?34.0:0.0
}
var k_XJTabbarAndSafeAreaHeight_S: CGFloat{
    return k_XJTabbarHeight_S+k_XJTabbarSafeAreaHeight_S
}
var XJWideScale: CGFloat{
    return UIScreen.main.bounds.width/375.0
}


//bool判断
var  is_XJIphone_S: Bool {
    return UIDevice.current.userInterfaceIdiom == .phone
}

var  is_XJIphoneWithSafeArea_S: Bool {
    if is_XJIphone_S , #available(iOS 11.0, *){
        if Double((UIApplication.shared.delegate?.window??.safeAreaInsets.bottom)!) > 0.0 {
            return true
        }
    }
    return false
}




//适配值

func AutoWideValue(_ value: CGFloat) -> CGFloat {
    CGFloat(value)*XJWideScale
}
func AutoWideValue(_ value: Int) -> CGFloat {
    CGFloat(value)*XJWideScale
}
func AutoWideValue(_ value: Double) -> CGFloat {
    CGFloat(value)*XJWideScale
}

func AutoWideValueIphoneXAdd(_ value: CGFloat, append: CGFloat) -> CGFloat {
    let needAdd: CGFloat = is_XJIphoneWithSafeArea_S ? CGFloat(append)*XJWideScale : 0.0
    return CGFloat(value)*XJWideScale + needAdd
}
func AutoWideValueIphoneXAdd(_ value: Int, append: Int) -> CGFloat {
    let needAdd: CGFloat = is_XJIphoneWithSafeArea_S ? CGFloat(append)*XJWideScale : 0.0
    return CGFloat(value)*XJWideScale + needAdd
}
func AutoWideValueIphoneXAdd(_ value: Double, append: Double) -> CGFloat {
    let needAdd: CGFloat = is_XJIphoneWithSafeArea_S ? CGFloat(append)*XJWideScale : 0.0
    return CGFloat(value)*XJWideScale + needAdd
}



/**
    苹方-简 常规体
 　　font-family: PingFangSC-Regular, sans-serif;
*/
func XJFontPingSC_Regular(_ fontsize: Int) -> UIFont{
    UIFont(name: "PingFangSC-Regular", size: CGFloat(fontsize)*XJWideScale) ?? UIFont.systemFont(ofSize: CGFloat(fontsize)*XJWideScale)
}

/**
    苹方-简 中黑体
    font-family: PingFangSC-Medium, sans-serif;
*/
func XJFontPingSC_Medium(_ fontsize: Int) -> UIFont{
    UIFont(name: "PingFangSC-Medium", size: CGFloat(fontsize)*XJWideScale) ?? UIFont.systemFont(ofSize: CGFloat(fontsize)*XJWideScale)
}

/** 　　苹方-简 中粗体
　　font-family: PingFangSC-Semibold, sans-serif;
*/
func XJFontPingSC_Semibold(_ fontsize: Int) -> UIFont{
    UIFont(name: "PingFangSC-Semibold", size: CGFloat(fontsize)*XJWideScale) ?? UIFont.systemFont(ofSize: CGFloat(fontsize)*XJWideScale)
}
/**
    苹方-简 纤细体
    font-family: PingFangSC-Thin, sans-serif;
*/
func XJFontPingSC_Thin(_ fontsize: Int) -> UIFont{
    UIFont(name: "PingFangSC-Thin", size: CGFloat(fontsize)*XJWideScale) ?? UIFont.systemFont(ofSize: CGFloat(fontsize)*XJWideScale)
}
/**
    苹方-简 细体
    font-family: PingFangSC-Light, sans-serif;
*/
func XJFontPingSC_Light(_ fontsize: Int) -> UIFont{
    UIFont(name: "PingFangSC-Light", size: CGFloat(fontsize)*XJWideScale) ?? UIFont.systemFont(ofSize: CGFloat(fontsize)*XJWideScale)
}
/**
    苹方-简 极细体
    font-family: PingFangSC-Ultralight, sans-serif;
*/
func XJFontPingSC_Ultralight(_ fontsize: Int) -> UIFont{
    UIFont(name: "PingFangSC-Ultralight", size: CGFloat(fontsize)*XJWideScale) ?? UIFont.systemFont(ofSize: CGFloat(fontsize)*XJWideScale)
}



extension UIColor {

    convenience init(colorHex: String) {
        if colorHex.hasPrefix("#"), colorHex.count == 7{
            let newColor = colorHex.suffix(6)
            let scanner = Scanner(string: String(newColor))
            scanner.scanLocation = 0
            var rgbValue: UInt64 = 0
            scanner.scanHexInt64(&rgbValue)
            let r = (rgbValue & 0xff0000) >> 16
            let g = (rgbValue & 0xff00) >> 8
            let b = rgbValue & 0xff
            self.init(
                red: CGFloat(r) / 0xff,
                green: CGFloat(g) / 0xff,
                blue: CGFloat(b) / 0xff, alpha: 1
            )
        }else{
            self.init(
                red: 0.0,
                green: 0.0,
                blue: 0.0, alpha: 1
            )
        }
    }
}

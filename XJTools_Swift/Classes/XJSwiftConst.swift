//
//  File.swift
//  XJ_Imiayu_Project
//
//  Copyright © 2019 XJ. All rights reserved.
//

import Foundation

var  is_XJIphone_S:Bool {
    return UIDevice.current.userInterfaceIdiom == .phone
} 

var  is_XJIphoneWithSafeArea_S:Bool {
    if is_XJIphone_S , #available(iOS 11.0, *){
        if Double((UIApplication.shared.delegate?.window??.safeAreaInsets.bottom)!) > 0.0 {
            return true
        }
    }
    return false
}

var k_XJScreenWide_S:CGFloat{
    return UIScreen.main.bounds.size.width;
}   

var k_XJScreenHeight_S:CGFloat{
    return UIScreen.main.bounds.size.height;
} 

var k_XJStatusBarHeight_S:CGFloat{
    return UIApplication.shared.statusBarFrame.size.height
}      
var k_XJNavHeight_S:CGFloat{
    return 44.0
} 

var k_XJNavAndStatusHeight_S:CGFloat{
    return k_XJStatusBarHeight_S+k_XJNavHeight_S;
} 

var k_XJTabbarHeight_S:CGFloat{
    return 49.0;
} 

var k_XJTabbarSafeAreaHeight_S:CGFloat{
    return is_XJIphoneWithSafeArea_S ?34.0:0.0;
} 

var k_XJTabbarAndSafeAreaHeight_S:CGFloat{
    return k_XJTabbarHeight_S+k_XJTabbarSafeAreaHeight_S;
} 




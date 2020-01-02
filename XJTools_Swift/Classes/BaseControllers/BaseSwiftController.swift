//
//  XJTools_Swift
//  Created by JingXueLong.
//  Copyright © 2018 JingXueLong. All rights reserved.
//

import UIKit
import SnapKit

open class BaseSwiftController: UIViewController {
    
    /// 重写以是否添加导航条 default false
    open var needNavView: Bool {get{return true}}
    /// 重写此属性不需再重写需要导航条 default false
    open var needBackBtn: Bool {get{return false}}
    /// 重写此属性更改title default nil
    open var titleName: String? {get{return nil}}

    public private (set) lazy var navView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: k_XJScreenWide_S, height: k_XJNavAndStatusHeight_S))
    public private (set) lazy var titleLabel: UILabel = UILabel()
    public private (set) lazy var backBtn: UIButton = UIButton()
    public private (set) lazy var lineView: UIView = UIView()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        automaticallyAdjustsScrollViewInsets = false
        if needNavView || needBackBtn {
            addNavView()
        }
    }
    
    
    ///override
    @objc open func back(){
        if let nav = navigationController {
            nav.popViewController(animated: true)
        }else{
            dismiss(animated: true, completion: nil)
        }
    }

    
    //MARK: 私有方法
    private func addNavView() {
        view.addSubview(navView)
        navView.backgroundColor = .white
        let centY: CGFloat = k_XJNavHeight_S/2.0 + k_XJStatusBarHeight_S
        
        if needBackBtn {
            backBtn.setImage(UIImage(named: "top_Back_black"), for: .normal)
            navView.addSubview(backBtn)
            backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
            backBtn.snp.makeConstraints { (make) in
                make.left.bottom.equalToSuperview()
                make.size.equalTo(CGSize(width: k_XJNavHeight_S, height: k_XJNavHeight_S))
            }
        }
        
        titleLabel.text = titleName
        titleLabel.font = XJFontPingSC_Medium(18)
        titleLabel.textColor = .init(colorHex: "#111111")
        navView.addSubview(titleLabel)
        lineView.backgroundColor = .init(colorHex: "dddddd")
        navView.addSubview(lineView)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(centY)
            make.centerX.equalToSuperview()
            make.width.lessThanOrEqualTo(230.XJWide)
        }

        lineView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(k_pixWide_S)
        }
    }

}


extension BaseSwiftController{  //MARK:  通用扩展方法分类
    
    /// 快速获取tableview 预估值均为0，滑条显示关闭，自适应conteninset关闭
    /// - Parameter frame: fram
    /// - Parameter style: style
    public class func getNormalTableView(frame: CGRect, style: UITableView.Style = .plain ) -> UITableView {
        let tableView = UITableView(frame: frame, style: style)
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        return tableView
    }
    
    /// 快速获取tableview 预估值均为0，滑条显示关闭，自适应conteninset 关闭
    /// - Parameter frame: fram
    /// - Parameter style: style
    public func getNormalTableView(frame: CGRect, style: UITableView.Style = .plain ) -> UITableView {
        return BaseSwiftController.getNormalTableView(frame: frame, style: style)
    }
    
    

}



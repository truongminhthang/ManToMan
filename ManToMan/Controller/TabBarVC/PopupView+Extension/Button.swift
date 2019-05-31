//
//  Button.swift
//  JobMasterManToMan
//
//  Created by Van Dong on 13/05/2019.
//  Copyright © 2019 VanDong. All rights reserved.
//

import UIKit
class Button: UIButton {
    weak var popupView: PopupView?
    override var isSelected: Bool{
        didSet{
            backgroundColor = isSelected ? UIColor.white : UIColor.clear
            popupView?.isOpen = isSelected
        }
    }
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight, .topLeft], cornerRadii: CGSize(width: 10, height: 10))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        isSelected = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        isSelected = false
    }
    
}

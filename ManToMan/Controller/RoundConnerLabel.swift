//
//  RoundConnerLabel.swift
//  ManToMan
//
//  Created by Toan on 1/2/19.
//  Copyright © 2019 Thang Hoa. All rights reserved.
//
import UIKit
@IBDesignable
class CustomLabel: UILabel {
    private var _cornerRadius: CGFloat = 0.0
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set (newValue) {
            _cornerRadius = newValue
            setCornerRadius()
        }
        get {
            return _cornerRadius
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setCornerRadius()
    }
    func setCornerRadius() {
        if _cornerRadius == -1 {
            layer.cornerRadius = 10
            
        } else {
            layer.cornerRadius = _cornerRadius
        }
    }
}

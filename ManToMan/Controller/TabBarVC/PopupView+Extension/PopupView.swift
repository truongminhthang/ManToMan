//
//  PopupView.swift
//  JobMasterManToMan
//
//  Created by Van Dong on 14/05/2019.
//  Copyright © 2019 VanDong. All rights reserved.
//

import Foundation
import UIKit

class PopupView: UIView{
    @IBOutlet weak var neckView: UIView!
    @IBOutlet weak var coverButton: UIButton!
    weak var containerView: UIView?
    weak var dropButton: Button?
    var isOpen: Bool = false {
        didSet{
            coverButton?.alpha = isOpen ? 0.6 : 0
            if isOpen{
                addToView()
            } else {
                if superview != nil {
                    self.removeFromSuperview()
                }
            }
        }
    }
    func setupSupportView(containerView: UIView, dropButton: Button) {
        self.containerView = containerView
        self.dropButton = dropButton
        self.dropButton?.popupView = self
    }
    
    @IBAction func onClickButtonCover(_ sender: Any) {
        dropButton?.isSelected = false
    }
    
    func addToView() {
        containerView?.addSubview(self)
        guard let dropButton = dropButton else {return}
        self.fill(left: 0, top: nil, right: 0, bottom: -100)
        self.topAnchor.constraint(equalTo: dropButton.bottomAnchor).isActive = true
        neckView.frame = CGRect(x: dropButton.frame.minX + 4, y: 0, width: dropButton.frame.width, height: 10)
    }
}

class PopupView1: PopupView {
    
}

class PopupView2: PopupView {
    
}

class PopupView3: PopupView {
    
}

//
//  PopupView.swift
//  JobMasterManToMan
//
//  Created by Van Dong on 14/05/2019.
//  Copyright © 2019 VanDong. All rights reserved.
//

import Foundation
import UIKit
class PopupView: UIView {
    @IBOutlet weak var neckView: UIView!
    
    @IBOutlet weak var coverButton: UIButton!
    weak var selectedButton: Button?
    
    var isOpen: Bool! = false {
        didSet{
            coverButton.alpha = isOpen ? 0.6 : 0
            if !isOpen{
                self.removeFromSuperview()
                selectedButton?.isSelected = false
            }
        }
    }
    
    func layoutNeckView(_ button: Button) {
        isOpen = true
        neckView.frame = CGRect(x: button.frame.minX + 4 , y: 0, width: button.frame.width, height: 10)
        selectedButton = button
    }
    @IBAction func clickCoverButton(_ sender: Any) {
        isOpen = false
    }
    
    func toggle(){
        isOpen = !isOpen
    }
    
}

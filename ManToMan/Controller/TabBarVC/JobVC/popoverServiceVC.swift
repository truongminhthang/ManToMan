//
//  popoverServiceVC.swift
//  ManToMan
//
//  Created by Toan on 1/21/19.
//  Copyright © 2019 Thang Hoa. All rights reserved.
//

import UIKit

class popoverServiceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    
    }
    override func viewWillLayoutSubviews() {
        preferredContentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height/3)
    }

}

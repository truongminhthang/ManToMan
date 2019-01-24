//
//  StartViewController.swift
//  ManToMan
//
//  Created by Toan on 12/25/18.
//  Copyright © 2018 Thang Hoa. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = startButton.frame.size.height / 2  
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

}

@IBDesignable
class customButton : UIButton {
    private var _cornerRadius : CGFloat = 0.0
    
    @IBInspectable
    var cornerRadius : CGFloat {
        set (newValue) {
            _cornerRadius = newValue
            setCornerRadius()
        } get {
            
            return _cornerRadius
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setCornerRadius()
        
    }
    func setCornerRadius() {
        if _cornerRadius == -1 {
            layer.cornerRadius = frame.height / 2
        } else {
            layer.cornerRadius = _cornerRadius
            
        }
    }
    
}




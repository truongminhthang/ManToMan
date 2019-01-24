//
//  Popview.swift
//  ManToMan
//
//  Created by Toan on 1/23/19.
//  Copyright © 2019 Thang Hoa. All rights reserved.
//

import UIKit
// MARK: - Delegate
//protocol <#name#> {
//    <#requirements#>
//}


class Popview: UIView {
    
    @IBOutlet var ServicePopview: UIView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
//    @IBOutlet weak var firstDropBox: DropBox!
//    @IBOutlet weak var secondDropBox: DropBox!
    @IBOutlet weak var coverButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var popBody: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureXIB()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureXIB()
    }
    func configureXIB() {
        
        ServicePopview = configureNib()
        
        // use bounds not frame or it’ll be offset
        
        ServicePopview.frame = bounds
        
        // Make the flexible view
        
        ServicePopview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        
        addSubview(ServicePopview)
        
    }
    
    func configureNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        
        let nib = UINib(nibName: "Popview", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
        
    }
    
//    private func commonInit() {
//
//        Bundle.main.loadNibNamed("Popview", owner: self, options: nil)
//        addSubview(ServicePopview)
//        ServicePopview.frame = self.bounds
//        ServicePopview.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//    }
}

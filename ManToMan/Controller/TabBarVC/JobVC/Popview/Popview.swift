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

@IBDesignable
class Popview: UIView {
    
    @IBOutlet var ServicePopview: UIView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
//    @IBOutlet weak var firstDropBox: DropBox!
//    @IBOutlet weak var secondDropBox: DropBox!
    @IBOutlet weak var coverButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var popBody: UIView!

    //TODO: Round View corner
    
//    @IBInspectable var cornerRadius: CGFloat = 5.0 {
//        didSet {
//            popBody.layer.cornerRadius = cornerRadius
//        }
//    }
    
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
        
        popBody.layer.cornerRadius = 5.0
        // Adding custom subview on top of our view (over any custom drawing > see note below)
//        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: 10, height: 10))
//        let maskLayer = CAShapeLayer()
//        maskLayer.path = path.cgPath
//        //        self.roundCorners([.topLeft, .topRight], radius: 10)
//        self.layer.mask = maskLayer
        
        addSubview(ServicePopview)
        
    }
    
    func configureNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        
        let nib = UINib(nibName: "Popview", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
        
    }
    
    
    override func draw(_ rect: CGRect) {

    }
//    private func commonInit() {
//
//        Bundle.main.loadNibNamed("Popview", owner: self, options: nil)
//        addSubview(ServicePopview)
//        ServicePopview.frame = self.bounds
//        ServicePopview.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//    }
}

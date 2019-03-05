//
//  VerticalButton.swift
//  ManToMan
//
//  Created by Toan on 1/20/19.
//  Copyright © 2019 Thang Hoa. All rights reserved.
//

import UIKit


@IBDesignable
class VerticalButton: UIButton {
    // MARK: - Set title beneath image.
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let rect = super.titleRect(forContentRect: contentRect)
        let imageRect = super.imageRect(forContentRect: contentRect)
        
        return CGRect(x: contentRect.width/2.0 - rect.width/2.0,
                      y: (contentRect.height - imageRect.height)/2.0 ,
                      width: rect.width, height: rect.height)

    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let rect = super.imageRect(forContentRect: contentRect)
        let titleRect = self.titleRect(forContentRect: contentRect)
        
        return CGRect(x: contentRect.width/2.0 - rect.width/2.0, y: titleRect.maxY ,
                                  width: rect.width, height: rect.height)
    }
//    override func layoutIfNeeded() {
//        super.layoutIfNeeded()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        centerTitleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        centerTitleLabel()
    }
    
    private func centerTitleLabel() {
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 2
        
        
    }
//    override func setTitle(_ title: String?, for state: UIControl.State) {
//        self.setTitle("Work Location", for: .selected)
//        self.titleLabel?.numberOfLines = 2
//        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
//
//
//    }
    
    
    override var isSelected: Bool {

        didSet {
            self.layer.backgroundColor = (isSelected == true) ? UIColor.white.cgColor : UIColor.clear.cgColor
            
            // .Selected
            if isSelected == true {
//            let mySelectedAttributedTitle = NSAttributedString(string: "Service", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
//            self.setAttributedTitle(mySelectedAttributedTitle, for: .selected)
//            self.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
//            self.titleLabel?.font = UIFont.systemFont(ofSize: 21)
            self.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            self.titleLabel?.numberOfLines = 2
            
            setUpApearanceForSelectedButton()
            
            } else {
//            self.setImage(nil, for: .selected)
            // .Normal
//            let myNormalAttributedTitle = NSAttributedString(string: "Work Location",attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            
                
      //      self.setAttributedTitle(myNormalAttributedTitle, for: .selected)

//            self.titleLabel?.textAlignment = .center
            setUpApearanceForNormalButton()
            }
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
//        self.contentEdgeInsets = UIEdgeInsets(top: <#T##CGFloat#>, left: <#T##CGFloat#>, bottom: <#T##CGFloat#>, right: <#T##CGFloat#>)
        self.titleEdgeInsets = UIEdgeInsets(top: -8, left: 0, bottom: 15, right: 0)
        self.titleLabel?.numberOfLines = 2
        
        
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    func setUpApearanceForSelectedButton() {
        self.frame = CGRect(x: self.frame.origin.x + 4, y: self.frame.origin.y + 4, width: self.frame.width - 8, height: self.frame.height)
//        self.titleEdgeInsets = UIEdgeInsets(top: -8, left: 0, bottom: 15, right: 0)

    }
    func setUpApearanceForNormalButton() {
        self.frame = CGRect(x: self.frame.origin.x - 4, y: self.frame.origin.y - 4, width: self.frame.width + 8, height: self.frame.height)
//        self.contentEdgeInsets = UIEdgeInsets(top: -8, left: 0, bottom: 0, right: 0)
    }
    
    override var contentEdgeInsets: UIEdgeInsets {
        get {
            return super.contentEdgeInsets
        }
        set {
            super.contentEdgeInsets = newValue
            self.layoutIfNeeded()
        }
    }
}
//extension UIButton {
//
//    func centerVertically(padding: CGFloat = 6.0) {
//        guard
//            let imageViewSize = self.imageView?.frame.size,
//            let titleLabelSize = self.titleLabel?.frame.size else {
//                return
//        }
//
//        let totalHeight = imageViewSize.height + titleLabelSize.height + padding
//
//        self.imageEdgeInsets = UIEdgeInsets(
//            top: -(totalHeight - imageViewSize.height),
//            left: 0.0,
//            bottom: 0.0,
//            right: -titleLabelSize.width
//        )
//
//        self.titleEdgeInsets = UIEdgeInsets(
//            top: 0.0,
//            left: -imageViewSize.width,
//            bottom: -(totalHeight - titleLabelSize.height),
//            right: 0.0
//        )
//
//        self.contentEdgeInsets = UIEdgeInsets(
//            top: 0.0,
//            left: 0.0,
//            bottom: titleLabelSize.height,
//            right: 0.0
//        )
//    }
//
//}

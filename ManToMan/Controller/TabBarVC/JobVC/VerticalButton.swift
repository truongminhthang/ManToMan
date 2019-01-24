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
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        
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

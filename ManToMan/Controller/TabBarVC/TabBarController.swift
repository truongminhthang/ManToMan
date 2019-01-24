//
//  TabBarController.swift
//  ManToMan
//
//  Created by Toan on 1/15/19.
//  Copyright © 2019 Thang Hoa. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    @IBOutlet weak var stackViewButton: UIStackView!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var jobInfoButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.isEnabled = true
        tabBar.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9333333333, blue: 0.831372549, alpha: 1)
        view.addSubview(stackViewButton)
        setApperanceStackView()
        tabBar.bringSubviewToFront(stackViewButton)
        //stackViewButton
        chatButton.backgroundColor = UIColorFromRGB(rgbValue: 0xDE3A2B, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    func setApperanceStackView() {
        stackViewButton.backgroundColor = UIColor.red
        stackViewButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewButton.frame = CGRect(x: 0, y: view.frame.height - tabBar.frame.height, width: tabBar.frame.width, height: tabBar.frame.height)
        stackViewButton.topAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        stackViewButton.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor, constant: 0).isActive = true
        stackViewButton.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: 0).isActive = true
        stackViewButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        // 3
//        stackViewButton.heightAnchor.constraint(
//            equalTo: view.heightAnchor).isActive = true
        
        
        
    }
    func UIColorFromRGB(rgbValue: UInt, alpha: CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
        // MARK: - ACTION
    @IBAction func selected(_ sender: UIButton) {
        sender.isSelected = true
        chatButton.backgroundColor = chatButton.isSelected ? UIColorFromRGB(rgbValue: 0xDE3A2B, alpha: 1) : UIColor.red
        jobInfoButton.backgroundColor = jobInfoButton.isSelected ? UIColorFromRGB(rgbValue: 0xDE3A2B, alpha: 1) : UIColor.red
        if chatButton.isSelected {
            selectedIndex = 0
        } else {
            selectedIndex = 1
        }
        buttons.forEach { (button) in
            button.isSelected = false
        }

    }


}

//
//extension UITabBarController {
//
//    func setBadges(badgeValues: [Int]) {
//
//        for view in self.tabBar.subviews {
//            if view is CustomTabBadge {
//                view.removeFromSuperview()
//            }
//        }
//
//        for index in 0...badgeValues.count-1 {
//            if badgeValues[index] != 0 {
//                addBadge(index: index, value: badgeValues[index], color: UIColor.blue, font: UIFont(name: "Helvetica-Light", size: 11)!)
//            }
//        }
//    }
//
//    func addBadge(index: Int, value: Int, color: UIColor, font: UIFont) {
//        let badgeView = CustomTabBadge()
//
//        badgeView.clipsToBounds = true
//        badgeView.textColor = UIColor.white
//        badgeView.textAlignment = .center
//        badgeView.font = font
//        badgeView.text = String(value)
//        badgeView.backgroundColor = color
//        badgeView.tag = index
//        tabBar.addSubview(badgeView)
//
//        self.positionBadges()
//    }
//
//    override open func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        self.positionBadges()
//    }
//
//    // Positioning
//    func positionBadges() {
//
//        var tabbarButtons = self.tabBar.subviews.filter { (view: UIView) -> Bool in
//            return view.isUserInteractionEnabled // only UITabBarButton are userInteractionEnabled
//        }
//
//        tabbarButtons = tabbarButtons.sorted(by: { $0.frame.origin.x < $1.frame.origin.x })
//
//        for view in self.tabBar.subviews {
//            if view is CustomTabBadge {
//                let badgeView = view as! CustomTabBadge
//                self.positionBadge(badgeView: badgeView, items:tabbarButtons, index: badgeView.tag)
//            }
//        }
//    }
//
//    func positionBadge(badgeView: UIView, items: [UIView], index: Int) {
//
//        let itemView = items[index]
//        let center = itemView.center
//
//        let xOffset: CGFloat = 12
//        let yOffset: CGFloat = -14
//        badgeView.frame.size = CGSize(width: 17, height: 17)
//        badgeView.center = CGPoint(x: center.x + xOffset, y: center.y + yOffset)
//        badgeView.layer.cornerRadius = badgeView.bounds.width/2
//        tabBar.bringSubviewToFront(badgeView)
//    }
//}
//
//class CustomTabBadge: UILabel {
//
//}


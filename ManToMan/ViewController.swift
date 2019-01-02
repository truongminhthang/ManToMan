//
//  ViewController.swift
//  ManToMan
//
//  Created by Thang Hoa on 12/24/18.
//  Copyright © 2018 Thang Hoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var arr = [Int](1...5)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = String(arr[indexPath.row])
        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height-12), cornerRadius: 0).cgPath
        cell.layer.mask = maskLayer
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.lightGray
        tableView.rowHeight = 90
        tableView.separatorStyle = .none
//        let screenSize = UIScreen.main.bounds
//        let separatorHeight = CGFloat(0)
//        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: separatorHeight))
//        additionalSeparator.backgroundColor = UIColor.gray
//        self.view.addSubview(additionalSeparator)
//        tableView.rowHeight = 84
//        let screenSize = UIScreen.main.bounds
//        let separatorHeight = CGFloat(10.0)
//        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: self.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
//        additionalSeparator.backgroundColor = UIColor.gray
//        self.addSubview(additionalSeparator)
        //        func setUpHeaderTableView() {
        //            var titleHeight : CGFloat = 0
        //            titleHeight = 200
        //            let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: titleHeight))
        //            titleLabel.numberOfLines = 0
        //            titleLabel.font = UIFont.systemFont(ofSize: 25)
        //            let paragraphStype = NSMutableParagraphStyle()
        //            paragraphStype.paragraphSpacing = 10
        //            paragraphStype.alignment = NSTextAlignment.center
        //            let attributed = [NSAttributedString.Key.font: titleLabel.font, NSAttributedString.Key.paragraphStyle: paragraphStype]
        
        
        //            let text = NSMutableAttributedString(string: Languages.homePlaceTitle)
        //            text.addAttributes(attributed, range: NSRange(location: 0, length: text.length))
        //            titleLabel.attributedText = text
        //            tableView.tableHeaderView = titleLabel
        
    }
    //        setUpHeaderTableView()
    // Do any additional setup after loading the view, typically from a nib.
}





//
//  CityTableViewController.swift
//  ManToMan
//
//  Created by Toan on 12/25/18.
//  Copyright © 2018 Thang Hoa. All rights reserved.
//

import UIKit

class CityTableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var cityLists = getDataFromPlist.shared._arrayCities
    var selectedArea : City?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
//        view.backgroundColor = UIColorFromRGB(rgbValue: 0xFEEED4, alpha: 1.00)
        tableView.rowHeight = 84
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColorFromRGB(rgbValue: 0xFEEED4, alpha: 1.00)
        let heightForHeaderView : CGFloat = 200
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: heightForHeaderView))
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        let paragraphStype = NSMutableParagraphStyle()
        paragraphStype.paragraphSpacing = 10
        paragraphStype.alignment = NSTextAlignment.center
        let attributed = [NSAttributedString.Key.font: titleLabel.font, NSAttributedString.Key.paragraphStyle: paragraphStype]
        let text = NSMutableAttributedString(string: "Where are you living?")
        text.addAttributes(attributed, range: NSRange(location: 0, length: text.length))
        titleLabel.attributedText = text
        tableView.tableHeaderView = titleLabel
        
    }
    class func storyboardIdentifier() -> String {
        return "HomePlaceSelectionVC"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cityLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CityTableViewCell
        cell.cityLabel.text = cityLists[indexPath.row].Name
        /* this is where the magic happens, create a UIView and set its
         backgroundColor to what ever color you like then set the cell's
         selectedBackgroundView to your created View */
//        let backgroundView = UIView()
//        backgroundView.backgroundColor = UIColorFromRGB(rgbValue: 0xfe6d8c, alpha: 0.66)
//        cell.selectedBackgroundView = backgroundView
//
        return cell
    }
    func UIColorFromRGB(rgbValue: UInt, alpha: CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
//        selectedCell.contentView.backgroundColor = UIColorFromRGB(rgbValue: 0xfe6d8c, alpha: 0.66)
//        
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            if let DistrictTVC = segue.destination as? DistrictTableViewController {
                DistrictTVC.cityCode = cityLists[indexPath.row].CityCode
                UserDefaults.standard.set(cityLists[indexPath.row].Name, forKey: "city")
            }
        }
    }


}

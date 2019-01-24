//
//  RegistrationStatusViewController.swift
//  ManToMan
//
//  Created by Toan on 1/4/19.
//  Copyright © 2019 Thang Hoa. All rights reserved.
//

import UIKit

class RegistrationStatusViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RegistrationCell
        cell.backgroundColor = UIColorFromRGB(rgbValue: 0xFEEED4, alpha: 1.00)
        cell.titleLabel.text = titles[indexPath.row]
        
        return cell
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continueButton: UIButton!
    
    var nextButton: customButton!
    
    var titles : [String] = ["Not set","Dispatch registered","Recruitment registered"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let heightForHeaderView : CGFloat = 200
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: heightForHeaderView))
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        let paragraphStype = NSMutableParagraphStyle()
        paragraphStype.paragraphSpacing = 10
        paragraphStype.alignment = NSTextAlignment.center
        let attributed = [NSAttributedString.Key.font: titleLabel.font, NSAttributedString.Key.paragraphStyle: paragraphStype]
        let text = NSMutableAttributedString(string: "Man To Man \n Please let me know the registration status")
        text.addAttributes(attributed, range: NSRange(location: 0, length: text.length))
        titleLabel.attributedText = text
        tableView.tableHeaderView = titleLabel
        tableView.backgroundColor = UIColorFromRGB(rgbValue: 0xFEEED4, alpha: 1.00)

        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)!.isSelected = true ? continueButton.isEnabled : !continueButton.isEnabled
////        tableView.indexPat
////        tableView.indexPathForSelectedRow == nil ? continueButton.isHidden : continueButton.isEnabled
//        if continueButton.isEnabled {
//            if continueButton.isSelected {
//                let registerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JobVC") as! Job_InformationVC
//                navigationController?.pushViewController(registerVC, animated: true)
//            }
//        } else {
//            continueButton.isSelected = continueButton.isHidden
//        }
        
            
        
        
    }
//    @objc func push() {
//        if let registerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Job_InformationVC") as? Job_InformationVC
//        {
//            self.navigationController?.pushViewController(registerVC, animated: true)
//            
//        }
//    }
    // MARK: - ACTION
    @IBAction func continueButton(_ sender: UIButton) {
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.cellForRow(at: indexPath)?.isSelected = false ? !sender.isEnabled : sender.isEnabled
            let tabbarVC = storyboard!.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarController
            navigationController?.pushViewController(tabbarVC, animated: true)
//            present(tabbarVC, animated: true, completion: nil)
            
        }
    }

}

//
//  DistrictTableViewCell.swift
//  ManToMan
//
//  Created by Toan on 1/2/19.
//  Copyright © 2019 Thang Hoa. All rights reserved.
//

import UIKit

class DistrictTableViewCell: UITableViewCell {

    @IBOutlet weak var districtLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            districtLabel.backgroundColor = UIColorFromRGB(rgbValue: 0xfe6d8c, alpha: 0.66)
        }
        else {
            districtLabel.backgroundColor = UIColor.white
        }
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        self.districtLabel.text = ""
    }
    func UIColorFromRGB(rgbValue: UInt, alpha: CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

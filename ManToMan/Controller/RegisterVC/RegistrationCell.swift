//
//  RegistrationCell.swift
//  ManToMan
//
//  Created by Toan on 1/4/19.
//  Copyright © 2019 Thang Hoa. All rights reserved.
//

import UIKit

class RegistrationCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        titleLabel.backgroundColor = selected ? UIColorFromRGB(rgbValue: 0xfe6d8c, alpha: 0.66) : UIColor.white
        
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    

}

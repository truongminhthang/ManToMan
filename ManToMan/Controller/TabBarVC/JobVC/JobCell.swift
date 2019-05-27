//
//  JobCell.swift
//  JobMasterManToMan
//
//  Created by Van Dong on 14/05/2019.
//  Copyright © 2019 VanDong. All rights reserved.
//

import UIKit
protocol JobCellDelegate {
    func callCellPhone(index: Int)
    func showCellWeb(index: Int)
}

class JobCell: UITableViewCell {
    
    @IBOutlet weak var jobView: UIView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var salary: UILabel!
    @IBOutlet weak var jobs: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var status: UILabel!
    
    var cellDelegate: JobCellDelegate?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    // MARK: - ACTION
    @IBAction func buttonWeb(sender: UIButton) {
        cellDelegate?.showCellWeb(index: index!.row)
    }
    @IBAction func buttonPhone(sender: UIButton) {
        cellDelegate?.callCellPhone(index: index!.row)
    }
    
    
    override func layoutSubviews() {
        jobView.rounderCorner(radius: 10)
    }
    
}

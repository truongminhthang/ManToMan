//
//  JobVC.swift
//  ManToMan
//
//  Created by Toan on 1/16/19.
//  Copyright © 2019 Thang Hoa. All rights reserved.
//

import UIKit

class JobVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var hiddenTopView: UIView!
    @IBOutlet weak var popView: Popview!
//    @IBOutlet weak var salaryPopView: <#type#>!
//    @IBOutlet weak var jobPopView: <#type#>!
    @IBOutlet weak var placeFilterButton: VerticalButton!
    @IBOutlet weak var salaryFilterButton: VerticalButton!
    @IBOutlet weak var jobFilterButton: VerticalButton!
    
    var isTapped : Bool = false {
        didSet {}
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupApperanceVerticalButton()
//        centerVertically()
        popView.isHidden = true
        hiddenTopView.isHidden = true
        setAppearancePopView()
        setAppearanceHiddenTopView()
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupApperanceVerticalButton()
    }
    
    func setAppearancePopView() {
//        popView.frame.origin.x = placeFilterButton.frame.origin.x
//        popView.frame.origin.y = placeFilterButton.frame.origin.y
        popView.topAnchor.constraint(equalTo: self.placeFilterButton.bottomAnchor, constant: 60)
        popView.frame.size = self.view.frame.size
        popView.frame.origin.y = self.view.frame.origin.y + 60
    }
    
    func setAppearanceHiddenTopView() {
        hiddenTopView.backgroundColor = UIColor.red
    }
    func setupApperanceVerticalButton() {
        //TODO: set up image for Button.
        jobFilterButton.imageView?.image = #imageLiteral(resourceName: "ic_arrow_down")
        salaryFilterButton.imageView?.image = #imageLiteral(resourceName: "ic_arrow_down")
        placeFilterButton.imageView?.image = #imageLiteral(resourceName: "ic_arrow_down")
        
        jobFilterButton.titleLabel?.text = "Job category"
        salaryFilterButton.titleLabel?.text = "Salary"
        placeFilterButton.titleLabel?.text = "Service"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    // Sửa hiddenTopView, chưa hiện ra được
    
    // MARK: - ACTION
    @IBAction func serviceAction(_ sender: UIButton) {
        popView.isHidden = !popView.isHidden
        hiddenTopView.isHidden = !hiddenTopView.isHidden
        !popView.isHidden ? view.bringSubviewToFront(popView) : view.bringSubviewToFront(placeFilterButton)
        !hiddenTopView.isHidden ? view.bringSubviewToFront(hiddenTopView) : view.bringSubviewToFront(placeFilterButton)
//        if !popView.isHidden {
//            view.bringSubviewToFront(popView)
//            view.bringSubviewToFront(hiddenTopView)
//        } else {
//            view.bringSubviewToFront(placeFilterButton)
//        }
//        popView.isHidden = sender.isSelected ? false : true
//        view.bringSubviewToFront(popView)

        
        
    }


}






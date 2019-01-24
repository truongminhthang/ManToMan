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
    
    @IBOutlet weak var popView: Popview!
    @IBOutlet weak var placeFilterButton: VerticalButton!
    @IBOutlet weak var salaryFilterButton: VerticalButton!
    @IBOutlet weak var jobFilterButton: VerticalButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupApperanceVerticalButton()
//        centerVertically()
        popView.isHidden = true
        setAppearancePopView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupApperanceVerticalButton()
    }
    
    func setAppearancePopView() {
//        popView.frame.origin.x = placeFilterButton.frame.origin.x
//        popView.frame.origin.y = placeFilterButton.frame.origin.y
        popView.topAnchor.constraint(equalTo: self.placeFilterButton.bottomAnchor, constant: 0)
        popView.frame.size = self.view.frame.size
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
    
    // MARK: - ACTION
    @IBAction func serviceAction(_ sender: UIButton) {
//        if sender.isSelected {
            popView.isHidden = false
//        popView.isHidden = placeFilterButton.isSelected ? false : true
        view.bringSubviewToFront(popView)
//        }

    }
    // MARK: - Prepare :
//    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//        return .none
//    }

}






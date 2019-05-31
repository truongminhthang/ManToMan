//
//  ViewController.swift
//  JobMasterManToMan
//
//  Created by Van Dong on 13/05/2019.
//  Copyright © 2019 VanDong. All rights reserved.
//

import UIKit

class JobMasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , JobCellDelegate{
    @IBOutlet weak var jobTableView: UITableView!
    
    var job = [Jobs]()
    
    @IBOutlet var headerButton: [Button]!
    
    @IBOutlet weak var locationButton: Button!
    
    @IBOutlet weak var salaryButton: Button!
    
    @IBOutlet weak var jobsButton: Button!
    
    @IBOutlet var popupView1: PopupView1!
    
    @IBOutlet var popupView2: PopupView2!
    
    @IBOutlet var popupView3: PopupView3!
    
    @IBOutlet weak var headerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobTableView.delegate = self
        jobTableView.dataSource = self
        setupTableView()
        getApiJobs()
        popupView1.setupSupportView(containerView: view, dropButton: locationButton)
        popupView2.setupSupportView(containerView: view, dropButton: salaryButton)
        popupView3.setupSupportView(containerView: view, dropButton: jobsButton)
        
        // Do any additional setup after loading the view.
    }
    func setupTableView() {
        jobTableView.showsVerticalScrollIndicator = false
        jobTableView.showsHorizontalScrollIndicator = false
        jobTableView.backgroundColor = UIColor.white
        jobTableView.isScrollEnabled = true
        jobTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    func getApiJobs() {
        DataService.requestData.getJobs { (data) in
            self.job = data
            self.jobTableView.reloadData()
        }
    }
    
    @IBAction func onClickSelectedButton (_ sender: Button){
        if sender.isSelected == true  {
            sender.isSelected = false
        } else {
            for button in headerButton{
                button.isSelected = false
            }
            sender.isSelected = true
        }
    }
    
}

extension JobMasterViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return job.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JobCell
        let dataCell = job[indexPath.row]
        cell.title.text = dataCell.title
        cell.salary.text = dataCell.salary
        cell.jobs.text = dataCell.jobs
        cell.location.text = dataCell.location
        cell.status.text = dataCell.status
        cell.cellDelegate = self
        cell.index = indexPath
        return cell
    }
    
    func showCellWeb(index: Int) {
        let sb = UIStoryboard(name: "Jobs", bundle: nil)
        guard let webView = sb.instantiateViewController(withIdentifier: "ShowWeb") as? WebViewController else {return}
        webView.viewWeb = job[index].showWeb
        navigationController?.pushViewController(webView, animated: true)
    }
    
    func callCellPhone(index: Int) {
        dialNumber(number: job[index].phone)
    }
    
    func dialNumber(number : String) {
        if let url = URL(string: "tel://\(number)"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            // add error message here
            print("Sai so")
        }
    }
    
    
}

//
//  ViewController.swift
//  JobMasterManToMan
//
//  Created by Van Dong on 13/05/2019.
//  Copyright © 2019 VanDong. All rights reserved.
//

import UIKit
typealias Json = Dictionary<String,Any>
struct Data{
    var title: String
    var salary: String
    var jobs: String
    var location: String
    var status: String
    var showJobDetail: String
    var showWeb: String
    var phone: String
    
}

class JobMasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , JobCellDelegate{
    
    @IBOutlet var headerButton: [Button]!
    
    @IBOutlet weak var  popupView: PopupView!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var jobTableView: UITableView!
    
    var data: [Data] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobTableView.delegate = self
        jobTableView.dataSource = self
        setupTableView()
        let urlString = "https://5ce261f6e3ced20014d3593e.mockapi.io/api/v1/jobs"
        makeRequestAPI(urlString: urlString, completedHandler: {
            var data = [Data]()
            for item in $0 {
                let title = (item["title"] as? String ) ?? ""
                let salary = (item["salary"] as? String ) ?? ""
                let jobs = (item["jobs"] as? String ) ?? ""
                let location = (item["location"] as? String ) ?? ""
                let status = (item["status"] as? String ) ?? ""
                let showJobDetail = (item["showJobDetail"] as? String ) ?? ""
                let showWeb = (item["showWeb"] as? String ) ?? ""
                let phone = (item["phone"] as? String ) ?? ""
                let job = Data(title: title, salary: salary, jobs: jobs, location: location, status: status, showJobDetail: showJobDetail, showWeb: showWeb, phone: phone)
                data.append(job)
            }
            self.data = data
            DispatchQueue.main.async {
                self.jobTableView.reloadData()
            }
        })
        
        // Do any additional setup after loading the view.
    }
    func setupTableView() {
        jobTableView.showsVerticalScrollIndicator = false
        jobTableView.showsHorizontalScrollIndicator = false
        jobTableView.backgroundColor = UIColor.white
        jobTableView.isScrollEnabled = true
        jobTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    @IBAction func selectButton(sender: Button) {
        headerButton.forEach{$0.isSelected = false}
        sender.isSelected = !sender.isSelected
        addPopupView()
        popupView.layoutNeckView(sender)
        
    }
    private func addPopupView(){
        view.addSubview(popupView)
        popupView.fill(left: 0, top: nil, right: 0, bottom: -100)
        popupView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        //        popupView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 4).isActive = true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JobCell
        let dataCell = data[indexPath.row]
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
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let webView = sb.instantiateViewController(withIdentifier: "ShowWeb") as? WebViewController else {return}
        webView.viewWeb = data[index].showWeb
        navigationController?.pushViewController(webView, animated: true)
    }
    
    func callCellPhone(index: Int) {
        dialNumber(number: data[index].phone)
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
    func makeRequestAPI(urlString: String, completedHandler: @escaping ([Json]) -> Void) {
        let session = URLSession(configuration: .default)
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 1000)
        request.httpMethod = "GET"
        let dataTask2 = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let response = response else {return}
            guard let data = data else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [Json]
                completedHandler(json)
            }catch {
                print(error.localizedDescription)
            }
            
            }.resume()
        
    }
    
    
}

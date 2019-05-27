//
//  WebViewController.swift
//  JobMasterManToMan
//
//  Created by Van Dong on 23/05/2019.
//  Copyright © 2019 VanDong. All rights reserved.
//

import WebKit
import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var viewWebDetail: WKWebView!
    var viewWeb: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if viewWeb != nil{
            let url = URL(string: viewWeb!)
            let request = URLRequest(url: url!)
            viewWebDetail.load(request)
        }
        // Do any additional setup after loading the view.
    }
    
    
}



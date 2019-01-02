//
//  AgeViewController.swift
//  ManToMan
//
//  Created by Toan on 12/26/18.
//  Copyright © 2018 Thang Hoa. All rights reserved.
//

import UIKit

class AgeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var agePickerView: UIPickerView!
    var yearsBirth : [Int] = [Int](1900...2005)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return yearsBirth.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(yearsBirth[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(yearsBirth[row], forKey: "age")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agePickerView.delegate = self
        agePickerView.dataSource = self
        agePickerView.selectRow(50, inComponent: 0, animated: true)
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func saveData(sender: UIButton) {
//
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

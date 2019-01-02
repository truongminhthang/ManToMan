//
//  GenderViewController.swift
//  ManToMan
//
//  Created by Toan on 12/26/18.
//  Copyright © 2018 Thang Hoa. All rights reserved.
//

import UIKit

class GenderViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var gender : [String] = ["Male","Female"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(gender[row], forKey: "gender")

    }
    
    
    @IBOutlet weak var genderPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        // Do any additional setup after loading the view.
        genderPickerView.selectRow(0, inComponent: 0, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
//    @IBAction func saveData(sender: UIButton) {
//        
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */

}

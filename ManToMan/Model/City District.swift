//
//  City District.swift
//  ManToMan
//
//  Created by Toan on 12/25/18.
//  Copyright © 2018 Thang Hoa. All rights reserved.
//

import Foundation
import UIKit

struct City {
    var Name : String?
    var CityCode : Int?
    
    init(Name: String, CityCode: Int) {
        self.Name = Name
        self.CityCode = CityCode
    }
}

struct District {
    var Name : String?
    var DistrictCode : Int?
    var Citycode : Int?
    
    init(Name: String, CityCode: Int, DistrictCode: Int) {
        self.Name = Name
        self.Citycode = CityCode
        self.DistrictCode = DistrictCode
    }
}

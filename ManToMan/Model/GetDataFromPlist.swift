//
//  GetDataFromPlist.swift
//  ManToMan
//
//  Created by Toan on 12/25/18.
//  Copyright © 2018 Thang Hoa. All rights reserved.
//

import UIKit
typealias JSON = Dictionary<AnyHashable, Any>
class getDataFromPlist {
    static let shared = getDataFromPlist()
    private init() {
        readFileCity()
        readFileDistrict()
    }
    var selectedCity : City? {
        didSet {
            guard selectedCity != nil else {return}
            _arrayFilter = _arrayDistricts.filter({ (data) -> Bool in
                return data.Citycode == selectedCity?.CityCode
            })
        }
    }
    var _arrayCities : [City] = []
    var _arrayDistricts : [District] = []
    var _arrayFilter : [District] = []
    
    func readFileCity() -> [City] {
        _arrayCities = []
        let path = Bundle.main.path(forResource: "Cities", ofType: "plist")
        
        let dict = NSDictionary(contentsOfFile: path!) as? JSON
        
        let citiesDict = dict!["Cities"] as? [JSON]
        
        citiesDict?.forEach { data in
            _arrayCities.append(City(Name: data["Name"] as! String, CityCode: data["CityCode"] as! Int))
        }
        return _arrayCities
    }
    
    func readFileDistrict() -> [District] {
        _arrayDistricts = []
        let path = Bundle.main.path(forResource: "Districts", ofType: "plist")
        
        let dict = NSDictionary(contentsOfFile: path!) as? JSON
        
        let citiesDict = dict!["Districts"] as? [JSON]
        
        citiesDict?.forEach { data in
            _arrayDistricts.append(District(Name: data["Name"] as! String, CityCode: data["CityCode"] as! Int, DistrictCode: data["DistrictCode"] as! Int))
        }
        return _arrayDistricts
    }
}

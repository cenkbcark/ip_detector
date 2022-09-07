//
//  LocationModel.swift
//  ipDetector
//
//  Created by Cenk Bahadır Çark on 7.09.2022.
//

import Foundation

struct LocationResponse : Codable {
    
    let ip, hostname, city, region: String?
    let country, loc, org, postal: String?
    let timezone: String?
    let readme: String?
}

class IPModel {
    
    static let shared = IPModel()
    
    var IPaddress: String?
    
    private init() { }
}

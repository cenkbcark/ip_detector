//
//  LocationService.swift
//  ipDetector
//
//  Created by Cenk Bahadır Çark on 7.09.2022.
//

import Foundation

class LocationService {
    
    static let shared = LocationService()
    
    func getIPLocation(url: String, completion : @escaping (LocationResponse) -> ()){
        
        if let url = URL(string: url){
            URLSession.shared.dataTask(with: url){data, response, error in
                if let data = data {
                    do{
                        let locationResponse = try JSONDecoder().decode(LocationResponse.self, from: data)
                        DispatchQueue.main.async {
                            completion(locationResponse)
                        }
                    }catch{
                        print("catch error")
                    }
                }else{
                    print("no data")
                }
            }.resume()
        }else{
            print("invalid URL")
        }
    }
}

//
//  IPService.swift
//  ipDetector
//
//  Created by Cenk Bahadır Çark on 7.09.2022.
//

import Foundation

class IPService {
    
    static let shared = IPService()
    
    func getIP(url: String, completion: @escaping (IPResponse) -> ()) {
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) {data, response, error in
                if let data = data{
                    do{
                        let ipDetect = try JSONDecoder().decode(IPResponse.self, from: data)
                        DispatchQueue.main.async {
                            completion(ipDetect)
                        }
                    }catch{
                        print("catch error")
                    }
                }else{
                    print("no data")
                }
            }.resume()
        }else{
            print("invalid url")
        }
        
    }
}

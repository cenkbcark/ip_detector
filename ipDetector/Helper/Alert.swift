//
//  Alert.swift
//  ipDetector
//
//  Created by Cenk Bahadır Çark on 7.09.2022.
//

import Foundation
import UIKit


class alertFunc {
    
    class func showAlert(title: String, message: String, vc: UIViewController){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true)
        
    }
}

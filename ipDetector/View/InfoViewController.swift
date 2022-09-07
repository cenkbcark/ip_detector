//
//  LocationViewController.swift
//  ipDetector
//
//  Created by Cenk Bahadır Çark on 7.09.2022.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var ipTextField: UITextField!
    
    @IBOutlet var infoLabels: [UILabel]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getting IP
        let ipText = ipTextField.text
        IPModel.shared.IPaddress = ipText
        
    }
    
    private func getLocationInfo(from ipText: String){
        
        LocationService.shared.getIPLocation(url: "https://ipinfo.io/\(ipText)/geo") { locationResponse in
            
            self.infoLabels.forEach { label in
                
                switch label.tag {
                    
                case 1:
                    label.text = "City:  \(locationResponse.city!)"
                case 2:
                    label.text = "Region:  \(locationResponse.region!)"
                case 3:
                    label.text = "Country:  \(locationResponse.country!)"
                case 4:
                    label.text = "Location:  \(locationResponse.loc!)"
                case 5:
                    label.text = "Organization:  \(locationResponse.org!)"
                case 6:
                    label.text = "Postal:  \(locationResponse.postal!)"
                case 7:
                    label.text = "Timezone:  \(locationResponse.timezone!)"
                default:
                    break
                    
                }
            }
        }
        
    }
    @IBAction func getButtonClicked(_ sender: Any) {
        
        if ipTextField.text == "" {
            alertFunc.showAlert(title: "Error", message: "Please enter a IP address", vc: self)
        }else{
            getLocationInfo(from: ipTextField.text ?? "")
        }
        
    }
    
}

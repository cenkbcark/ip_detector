//
//  ViewController.swift
//  ipDetector
//
//  Created by Cenk Bahadır Çark on 7.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func getIP() {
        IPService.shared.getIP(url: "https://api.ipify.org/?format=json") { response in
            self.ipLabel.text = response.ip
        }
    }

    @IBAction func getIPButtonClicked(_ sender: Any) {
        getIP()
    }
    
}


//
//  FindDriverController.swift
//  UniDriver
//
//  Created by Zachary Garlett on 11/21/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import UIKit

class FindDriverController: UIViewController {
    
   var controller = UniDataController()
   var signedInUser: UniUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   
    @IBAction func back(_ sender: Any) {
         _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func findDrivers(_ sender: Any) {
        controller.getDriveList(){
            list in
            print("numbers of drivers " + String(list.count))
        }
        dismiss(animated: true)
    }
    
    
    
    
}

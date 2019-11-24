//
//  DriverFoundController.swift
//  UniDriver
//
//  Created by Zachary Garlett on 11/24/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import UIKit

class DriverFoundController: UIViewController {
    
    var controller = UniDataController()
    var driverUser: UniUser?
    

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var make: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var fare: UILabel!
    @IBOutlet weak var license: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller.getUser(userName: driverUser!.username) { currUser in
            self.driverUser = currUser
            self.userName.text = self.driverUser!.name
            self.make.text = self.driverUser!.car?.make
            self.model.text = self.driverUser!.car?.model
            self.color.text = self.driverUser!.car?.color
            self.license.text = self.driverUser!.car?.licensePlate
            
            
        }

    
    }
    
    @IBAction func accept(_ sender: Any) {
        dismiss(animated: true)
    }
    
    

}

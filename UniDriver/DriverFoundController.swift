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
    var signedInUser: UniUser?
    

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var make: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var fare: UILabel!
    @IBOutlet weak var license: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller.getUser(userName: signedInUser!.username) { currUser in
            self.signedInUser = currUser
            self.userName.text = self.signedInUser!.name
            self.make.text = self.signedInUser!.car?.make
            self.model.text = self.signedInUser!.car?.model
            self.color.text = self.signedInUser!.car?.color
            self.license.text = self.signedInUser!.car?.licensePlate
            
            
        }

    
    }
    
    @IBAction func accept(_ sender: Any) {
        dismiss(animated: true)
    }
    
    

}

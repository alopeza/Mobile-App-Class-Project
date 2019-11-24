//
//  RiderFoundController.swift
//  UniDriver
//
//  Created by Zachary Garlett on 11/24/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import UIKit

class RiderFoundController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var tripTime: UILabel!
    @IBOutlet weak var fare: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func accept(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

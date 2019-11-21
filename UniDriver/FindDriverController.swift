//
//  FindDriverController.swift
//  UniDriver
//
//  Created by Zachary Garlett on 11/21/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import UIKit

class FindDriverController: UIViewController {
    
    @IBOutlet weak var findDriverLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    

}

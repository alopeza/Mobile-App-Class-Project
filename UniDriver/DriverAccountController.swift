//
//  DriverAccountController.swift
//  UniDriver
//
//  Created by Allan Nguyen on 11/21/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import UIKit

class DriverAccountController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var carMake: UITextField!
    @IBOutlet weak var carModel: UITextField!
    @IBOutlet weak var colorOfCar: UITextField!
    @IBOutlet weak var licensePlate: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var routingNumber: UITextField!
    @IBOutlet weak var bankAccountNumber: UITextField!
    @IBOutlet weak var hourlyRate: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

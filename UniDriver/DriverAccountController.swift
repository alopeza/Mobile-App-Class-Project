//
//  DriverAccountController.swift
//  UniDriver
//
//  Created by Allan Nguyen on 11/21/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import UIKit

class DriverAccountController: UIViewController {
    
    var controller = UniDataController()
    var signedDriverUser: UniUser?
    
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
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
        controller.getUser(userName: signedDriverUser!.username) { currUser in
            self.signedDriverUser = currUser
            self.username.text = self.signedDriverUser!.username
            self.password.text = self.signedDriverUser!.password
            self.email.text = self.signedDriverUser!.email
            self.carMake.text = self.signedDriverUser!.car?.make
            self.carModel.text = self.signedDriverUser!.car?.model
            self.colorOfCar.text = self.signedDriverUser!.car?.color
            self.licensePlate.text = self.signedDriverUser!.car?.licensePlate
            self.name.text = self.signedDriverUser!.name
            self.routingNumber.text = self.signedDriverUser!.bankInfo?.bankRoutingNumber
            self.bankAccountNumber.text = self.signedDriverUser!.bankInfo?.bankAccountNumber
            self.hourlyRate.text = (self.signedDriverUser!.driverFare)?.description
        }
    }
    
    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func Save(_ sender: Any) {
        if (username.text == "Username" || password.text == "Password" || email.text == "Email" || carMake.text == "Car Make" || carModel.text == "Car Model" || colorOfCar.text == "Color" || licensePlate.text == "License Plate #" || name.text == "Name on Bank Account" || routingNumber.text == "Routing Number" || bankAccountNumber.text == "Bank Account #" || hourlyRate.text == "Hourly Rate") {
            
            //alert user to enter all information
            let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
            let emptyField = UIAlertController(title: "Empty Field", message: "There is an empty field. Please enter all required information.", preferredStyle: .alert)
            emptyField.addAction(okay)
            present(emptyField, animated: true, completion: nil)
            
        }
        else {
            //create new user account
            let UpdateDriver = UniUser(username: username.text!, password: password.text!, name: name.text!, email: email.text!, userType: .Driver)
            UpdateDriver.setVehicle(make: carMake.text!, model: carModel.text!, color: colorOfCar.text!, licensePlate: licensePlate.text!)
            let fare = Double(hourlyRate.text!)!
            UpdateDriver.setFare(fare: fare)
            UpdateDriver.setBankInfo(bankAccountNumber: bankAccountNumber.text!, bankRoutingNumber: routingNumber.text!)
            let newData: UniDataController = UniDataController.init()
            newData.Save(user: UpdateDriver)
            let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
            let emptyField = UIAlertController(title: "Saved", message: "Updated your Account Infromation.", preferredStyle: .alert)
            emptyField.addAction(okay)
            present(emptyField, animated: true, completion: nil)
        }
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

//
//  DriverSignUpController.swift
//  UniDriver
//


import UIKit

class DriverSignUpController: UIViewController {
    
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
        
        //tapping anywhere on the screen will dismiss the keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        //check if all fields are filled out
        if (username.text == "Username" || password.text == "Password" || email.text == "Email" || carMake.text == "Car Make" || carModel.text == "Car Model" || colorOfCar.text == "Color" || licensePlate.text == "License Plate #" || name.text == "Name on Bank Account" || routingNumber.text == "Routing Number" || bankAccountNumber.text == "Bank Account #" || hourlyRate.text == "Hourly Rate") {
            
            //alert user to enter all information
            let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
            let emptyField = UIAlertController(title: "Empty Field", message: "There is an empty field. Please enter all required information.", preferredStyle: .alert)
            emptyField.addAction(okay)
            present(emptyField, animated: true, completion: nil)
            
        }
        else {
            //create new user account
            let newDriver = UniUser(username: username.text!, password: password.text!, name: name.text!, email: email.text!, userType: .Driver)
            newDriver.setVehicle(make: carMake.text!, model: carModel.text!, color: colorOfCar.text!, licensePlate: licensePlate.text!)
            let fare = Double(hourlyRate.text!)!
            newDriver.setFare(fare: fare)
            newDriver.setBankInfo(bankAccountNumber: bankAccountNumber.text!, bankRoutingNumber: routingNumber.text!)
            
            //check if username already exists
            let controller = UniDataController()
            var userCheck: UniUser?
            
            //query database
            controller.getUser(userName: username.text!) { currUser in
                userCheck = currUser
            }
            //username is not taken
            if userCheck == nil {
                
                //save it to the database
                let newData: UniDataController = UniDataController.init()
                newData.Save(user: newDriver)
                
                //segue to login screen
                performSegue(withIdentifier: "driverCreated", sender: username)
            }
                //username is taken
            else {
                //present alert
                let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
                let userTaken = UIAlertController(title: "Username Taken", message: "This username is already in use. Please choose a different username.", preferredStyle: .alert)
                userTaken.addAction(okay)
                present(userTaken, animated: true, completion: nil)
            }
        }
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

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
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        // need to add code to check if username already exists, prevent segue if so and present alert
        
        //create new user account
        let newDriver = UniUser(username: username.text!, password: password.text!, name: name.text!, email: email.text!, userType: .Driver)
        newDriver.setVehicle(make: carMake.text!, model: carModel.text!, color: colorOfCar.text!, licensePlate: licensePlate.text!)
        let fare = Double(hourlyRate.text!)!
        newDriver.setFare(fare: fare)
        newDriver.setBankInfo(bankAccountNumber: bankAccountNumber.text!, bankRoutingNumber: routingNumber.text!)
        
        //check if username already exists using arbitrary user
        let userCheck: UniUser? = newDriver.getUser(username: username.text!)
        
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

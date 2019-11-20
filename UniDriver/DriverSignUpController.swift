//
//  DriverSignUpController.swift
//  UniDriver
//


import UIKit

class DriverSignUpController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var carMake: UITextField!
    @IBOutlet weak var carModel: UITextField!
    @IBOutlet weak var colorOfCar: UITextField!
    @IBOutlet weak var licensePlate: UITextField!
    @IBOutlet weak var bankName: UITextField!
    @IBOutlet weak var bankAccountNumber: UITextField!
    @IBOutlet weak var hourlyRate: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        // need to add code to check if username already exists, prevent segue if so and present alert
        
        //create new user account
        //let newDriver = UniUser(username: <#T##String#>, password: <#T##String#>, name: <#T##String#>, email: <#T##String#>, userType: <#T##String#>)
        //segue to login screen
        //performSegue(withIdentifier: "", sender: <#T##Any?#>)
        
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

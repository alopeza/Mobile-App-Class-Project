//
//  RiderSignUpController.swift
//  UniDriver
//


import UIKit

class RiderSignUpController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var nameOfCard: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var expDate: UITextField!
    @IBOutlet weak var cvv: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        // need to add code to check if username already exists, prevent segue if so and present alert
        
        //create new user account
        let newRider = UniUser(username: username.text!, password: password.text!, name: nameOfCard.text!, email: email.text!, userType: .Rider)
        newRider.setCCInfo(ccNumber: cardNumber.text!, ccExpDate: expDate.text!, cvv: cvv.text!)
        let newData: UniDataController
        newData.Save(user: newRider)
        //segue to login screen
        performSegue(withIdentifier: "riderCreated", sender: <#T##Any?#>)
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

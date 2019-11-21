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
        
        //create new user account
        let newRider = UniUser(username: username.text!, password: password.text!, name: nameOfCard.text!, email: email.text!, userType: .Rider)
        newRider.setCCInfo(ccNumber: cardNumber.text!, ccExpDate: expDate.text!, cvv: cvv.text!)
        
        //check if username already exists using arbitrary user
        let userCheck: UniUser? = newRider.getUser(username: username.text!)
        
        //username is not taken
        if userCheck == nil {
            
            //save it to the database
            let newData: UniDataController = UniDataController.init()
            newData.Save(user: newRider)
            
            //segue to login screen
            performSegue(withIdentifier: "riderCreated", sender: username)
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

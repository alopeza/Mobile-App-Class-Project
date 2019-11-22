//
//  loginController.swift
//  UniDriver
//


import UIKit
import FirebaseDatabase

class LoginController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    //var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignIn(_ sender: Any) {
        
        let controller = UniDataController()
        var signedInUser: UniUser?
        
        //query database
        controller.getUser(userName: username.text!) { currUser in
            signedInUser = currUser
            
            
            if signedInUser != nil { //if the user exists
                
                //password is correct
                if signedInUser?.password == self.password.text! {
                    //perform segue and pass either username or reference
                    self.performSegue(withIdentifier: "SuccessfulSignIn", sender: self.password)
                }
                    //password incorrect, present alert
                else {
                    let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
                    let tryAgain = UIAlertController(title: "Incorrect Password", message: "The password was incorrect. Please try again.", preferredStyle: .alert)
                    tryAgain.addAction(okay)
                    self.present(tryAgain, animated: true, completion: nil)
                }
            }
                //username does not exist, present alert
            else {
                let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
                let tryAgain = UIAlertController(title: "Invalid Username", message: "The username was incorrect. Please try again or create a new account.", preferredStyle: .alert)
                tryAgain.addAction(okay)
                self.present(tryAgain, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //pass either username or ref here for successfulsignin segue only
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

//
//  loginController.swift
//  UniDriver
//


import UIKit
import FirebaseDatabase

class LoginController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignIn(_ sender: Any) {
        //robert's method may be used here instead
        //UniUser currUser = getUser(username)
        ref = Database.database().reference(withPath: "UniUser")
        ref.queryOrdered(byChild: "username").queryEqual(toValue: username) //query the database to see if the username exists
        
        if ref != nil { //if the user exists -> change ref to currUser here if using getUser method
            //check if password is correct
            /*if currUser.password == password {
            //perform segue and pass either username or reference
            performSegue(withIdentifier: "SuccessfulSignIn", sender: <#T##Any?#>)
            }*/
        }
        else {
            //alert saying this user does not exist, please reenter or create a new acct
            let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
            
            let tryAgain = UIAlertController(title: "Invalid Username/Password", message: "The username or password was incorrect. Please try again or create a new account.", preferredStyle: .alert)
            
            tryAgain.addAction(okay)
            
            present(tryAgain, animated: true, completion: nil)
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

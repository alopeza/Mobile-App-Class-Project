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
        //arbitrary user needed for getUser function
        let arbitrary: UniUser = UniUser.init(username: "m", password: "m", name: "m", email: "m", userType: .Rider)
        
        //query database
        let currUser: UniUser? = arbitrary.getUser(username: username.text!)
        
        //ref = Database.database().reference(withPath: "UniUser")
        //ref.queryOrdered(byChild: "username").queryEqual(toValue: username)
        
        if currUser != nil { //if the user exists
            
            //password is correct
            if currUser!.password == password.text! {
                //perform segue and pass either username or reference
                performSegue(withIdentifier: "SuccessfulSignIn", sender: password)
            }
                
            //password incorrect, present alert
            else {
                let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
                let tryAgain = UIAlertController(title: "Incorrect Password", message: "The password was incorrect. Please try again.", preferredStyle: .alert)
                tryAgain.addAction(okay)
                present(tryAgain, animated: true, completion: nil)            }
        }
        
        //username does not exist, present alert
        else {
            let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
            let tryAgain = UIAlertController(title: "Invalid Username", message: "The username was incorrect. Please try again or create a new account.", preferredStyle: .alert)
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

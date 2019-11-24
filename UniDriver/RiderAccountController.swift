//
//  RiderAccountController.swift
//  UniDriver
//
//  Created by Allan Nguyen on 11/21/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import UIKit

class RiderAccountController: UIViewController {
    
    var controller = UniDataController()
    var signedRiderUser: UniUser?
    
    
    @IBOutlet weak var username: UITextField!
      @IBOutlet weak var password: UITextField!
      @IBOutlet weak var email: UITextField!
      @IBOutlet weak var nameOfCard: UITextField!
      @IBOutlet weak var cardNumber: UITextField!
      @IBOutlet weak var expDate: UITextField!
      @IBOutlet weak var cvv: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)    
        // Do any additional setup after loading the view.
                
                
        controller.getUser(userName: signedRiderUser!.username) { currUser in
                self.signedRiderUser = currUser
                self.username.text = self.signedRiderUser!.username
                self.password.text = self.signedRiderUser!.password
                self.email.text = self.signedRiderUser!.email
                self.nameOfCard.text = self.signedRiderUser!.name
                self.cardNumber.text = self.signedRiderUser!.bankInfo?.ccNumber
                self.expDate.text = self.signedRiderUser!.bankInfo?.ccExpDate
                self.cvv.text = self.signedRiderUser!.bankInfo?.cvv
                
                }
        
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func Save(_ sender: Any) {
        if username.text == "Username" || password.text == "Password" || email.text == "Email" || nameOfCard.text == "Name on Credit Card" || cardNumber.text == "Credit Card #" || expDate.text == "Expiration Date" || cvv.text == "CVV" {
                   
                   //alert user to enter all information
                   let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
                   let emptyField = UIAlertController(title: "Empty Field", message: "There is an empty field. Please enter all required information.", preferredStyle: .alert)
                   emptyField.addAction(okay)
                   present(emptyField, animated: true, completion: nil)
                   
               }
               //all fields are filled out
               else {
               //create new user account
               let UpdateRider = UniUser(username: username.text!, password: password.text!, name: nameOfCard.text!, email: email.text!, userType: .Rider)
               UpdateRider.setCCInfo(ccNumber: cardNumber.text!, ccExpDate: expDate.text!, cvv: cvv.text!)
            let newData: UniDataController = UniDataController.init()
            newData.Save(user: UpdateRider)
            let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
            let emptyField = UIAlertController(title: "Saved", message: "Updated your Account Infromation.", preferredStyle: .alert)
            emptyField.addAction(okay)
            present(emptyField, animated: true, completion: nil)
        }
    }
}

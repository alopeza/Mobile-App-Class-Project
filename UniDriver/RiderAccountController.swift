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
    var signedInUser: UniUser?
    
    
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
                
                
        controller.getUser(userName: signedInUser!.username) { currUser in
                self.signedInUser = currUser
                self.username.text = self.signedInUser!.username
                self.password.text = self.signedInUser!.password
                self.email.text = self.signedInUser!.email
                self.nameOfCard.text = self.signedInUser!.name
                self.cardNumber.text = self.signedInUser!.bankInfo?.ccNumber
                self.expDate.text = self.signedInUser!.bankInfo?.ccExpDate
                self.cvv.text = self.signedInUser!.bankInfo?.cvv
                
                }
        
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }

}

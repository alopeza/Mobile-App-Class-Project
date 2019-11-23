//
//  RiderAccountController.swift
//  UniDriver
//
//  Created by Allan Nguyen on 11/21/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import UIKit

class RiderAccountController: UIViewController {
    
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
                let controller = UniDataController()
                var signedInUser: UniUser?
                
               controller.getUser(userName: "admin") { currUser in
                signedInUser = currUser
                    self.username.text = signedInUser!.username
                    self.password.text = signedInUser!.password
                    self.email.text = signedInUser!.email
                    self.nameOfCard.text = signedInUser!.name
                self.cardNumber.text = signedInUser!.bankInfo?.ccNumber
                self.expDate.text = signedInUser!.bankInfo?.ccExpDate
                self.cvv.text = signedInUser!.bankInfo?.cvv
                
                }
        
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }

}

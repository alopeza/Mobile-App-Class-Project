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

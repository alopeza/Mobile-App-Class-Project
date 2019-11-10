//
//  ViewController.swift
//  UniDriver
//
//  Created by Zachary Garlett on 10/18/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Programmatically go back in the navigation controller with animation
    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    //Programmatically go back in the navigation controller without animation
    @IBAction func backButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: false)
    }
}


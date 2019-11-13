//
//  ViewController.swift
//  UniDriver
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
    
    //test
}


//
//  DriverController.swift
//  UniDriver
//

import UIKit

class DriverController: UIViewController {

    @IBOutlet weak var clockOutButton: UIButton!
    @IBOutlet weak var clockInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clockOutButton.isHidden = true;
        clockOutButton.isEnabled = false;
    }
    
    
    @IBAction func ClockIn(_ sender: Any) {
        clockInButton.isHidden = true;
        clockInButton.isEnabled = false;
        clockOutButton.isHidden = true;
        clockOutButton.isEnabled = false;
        
    }
    
    @IBAction func ClockOut(_ sender: Any) {
        clockInButton.isHidden = false;
        clockInButton.isEnabled = true;
        clockOutButton.isHidden = true;
        clockOutButton.isEnabled = false;
    }
    
   
    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
}

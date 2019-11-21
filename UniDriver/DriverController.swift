//
//  DriverController.swift
//  UniDriver
//

import UIKit

class DriverController: UIViewController {


    @IBOutlet weak var clockInButton: UIButton!
    @IBOutlet weak var clockOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clockOutButton.isEnabled = false
        clockOutButton.isHidden = true
    
    }

   
    @IBAction func ClockIn(_ sender: Any) {
        clockInButton.isEnabled = false
        clockInButton.isHidden = true
        clockOutButton.isEnabled = true
        clockOutButton.isHidden = false
    }
    
    @IBAction func ClockOut(_ sender: Any) {
        clockInButton.isEnabled = true
        clockInButton.isHidden = false
        clockOutButton.isEnabled = false
        clockOutButton.isHidden = true
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

   
    
    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }

}

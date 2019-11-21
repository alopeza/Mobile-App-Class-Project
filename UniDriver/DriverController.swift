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

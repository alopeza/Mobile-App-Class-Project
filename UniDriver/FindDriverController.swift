//
//  FindDriverController.swift
//  UniDriver
//
//  Created by Zachary Garlett on 11/21/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import UIKit

class FindDriverController: UIViewController {
    
    var controller = UniDataController()
    var signedInUser: UniUser?
    var foundDriver = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Navigation
    @IBAction func back(_ sender: Any) {
         _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func findDrivers(_ sender: Any) {
        controller.getDriveList(){
            list in
            
            for driver in list {
               // if driver?.isLoggedIn == false {
                   // print("Found Driver")
                   // self.foundDriver = true
               // }
            }
        }
        
       
        print("Find Drivers")
        
        //dismiss(animated: true)
        
         _ = navigationController?.popViewController(animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RiderController {
            if !foundDriver {
                destination.unwindToRider(segue)
                print("No Drivers Methods")
            }
        }
    }
    
    
    
    
}

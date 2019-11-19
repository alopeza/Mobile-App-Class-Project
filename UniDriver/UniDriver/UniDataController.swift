//
//  UniDataController.swift
//  UniDriver
//
//  Created by user155127 on 11/17/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import Foundation
import Firebase

class UniDataController {
    
    //Set location
    func setLocation(user: UniUser, lat: Double, long: Double){
        var location = Location(latitude: lat, longitude: long)
        
        user.currentLocation = location
    }
    
    //Find driver
    
    //Lookup Rider/Driver
    
    
}

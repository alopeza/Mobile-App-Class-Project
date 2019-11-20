//
//  UniDataController.swift
//  UniDriver
//
//  Created by user155127 on 11/19/19.
//  Copyright © 2019 Robert Cook. All rights reserved.
//

import Foundation
import Firebase

class UniDataController{
    var userDB: DatabaseReference
    var tripDB: DatabaseReference
    
    init(){
        userDB = Database.database().reference(withPath: "uni-user")
        tripDB = Database.database().reference(withPath: "uni-trips")
    }
    
    func Save(user: UniUser){

        
        let userRef = self.userDB.child(user.username)
        userRef.setValue(user.toAnyObject())
        
        guard let trips = user.previousTrips else {return}
        let tripRef = self.tripDB.child(user.username)

        for trip in trips {
            tripRef.setValue(trip.toAnyObject())
        }
    }
    
    func testSave() {
        let newUser = UniUser(username: "cookr04", name: "Robert Cook", email: "robert.cook@okstate.edu", userType: .Driver)
        
        newUser.setCurrentLocation(lat: 2.554, long: 7.867)
        newUser.setVehicle(make: "Honda", model: "Pilot", color: "2012", licensePlate: "frr433")
        newUser.setCCInfo(ccNumber: "4353444434333222", ccExpDate: "10/12/2020")
        
        self.Save(user: newUser)
    }
}

//
//  UniUser.swift
//  UniDriver
//
//  Created by user155127 on 11/17/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import Foundation
import Firebase

struct UniUser{
    enum UserType{
        case Rider
        case Driver
    }
    
    var ref: DatabaseReference!
    var key: String
    var email: String
    var username: String
    var name: String
    var userType: UserType
    var currentLocation: Location?
    var currentTrip: Trip?
    var previousTrips: [Trip]?
    var car: Vehicle?
    var bankInfo: FinancialInfo?
    
    init (username: String, name: String, email: String, userType: UserType, key: String = ""){
        self.username = username
        self.name = name
        self.email = email
        self.userType = userType
        self.ref = nil
        self.key = key
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let email = value["email"] as? String,
            let username = value["username"] as? String,
            let name = value["name"] as? String,
            let userType = value["userType"] as? UserType
            else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.email = email
        self.username = username
        self.name = name
        self.userType = userType
    }
    
    func toAnyObject() -> Any{
        return [
            "key": key,
            "email": email,
            "username": username,
            "name": name,
            "userType": userType
        ]
    }
    
    //Set location
    func setLocation(lat: Double, long: Double){
        //TODO: Figure this out
        
        //self.currentLocation = Location(latitude: lat, longitude: long)
    }

}

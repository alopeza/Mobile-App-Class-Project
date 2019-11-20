//
//  UniUser.swift
//  UniDriver
//
//  Created by user155127 on 11/17/19.
//  Copyright © 2019 Robert Cook. All rights reserved.
//

import Foundation
import Firebase

class UniUser{
    enum UserType:CustomStringConvertible{
        case Rider
        case Driver
        
        var description: String{
            switch self {
                case .Rider: return "Rider"
                case .Driver: return "Driver"
            }
        }
    }
    
    var ref: DatabaseReference!
    var key: String
    var email: String
    var username: String
    var password: String
    var name: String
    var userType: UserType
    var currentLocation: Location?
    var currentTrip: Trip?
    var previousTrips: Array<Trip>?
    var car: Vehicle?
    var bankInfo: FinancialInfo?
    var driverFare: Double?
    
    init (username: String, password: String, name: String, email: String, userType: UserType){
        self.username = username
        self.password = password
        self.name = name
        self.email = email
        self.userType = userType
        self.ref = nil
        self.key = "" //will change this tomorrow, possibly adding code below to UniDataController -Melanie
            /*ref.childByAutoId().key!
        ref.child(key).setValue(self)*/
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let email = value["email"] as? String,
            let username = value["username"] as? String,
            let password = value["password"] as? String,
            let name = value["name"] as? String,
            let userType = value["userType"] as? UserType
            else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.email = email
        self.username = username
        self.password = password
        self.name = name
        self.userType = userType
    }
    
    func toAnyObject() -> Any{
        
        return [
            "key": key,
            "email": email,
            "username": username,
            "password": password,
            "name": name,
            "userType": userType.description,
            "location":[currentLocation?.toAnyObject()],
            "car":[car?.toAnyObject()],
            "bankInfo":[bankInfo?.toAnyObject()],
            "currentTrip":[currentTrip?.toAnyObject()]
        ]
    }
    
    //Set location
    func setCurrentLocation(lat: Double, long: Double){
        self.currentLocation = Location(latitude: lat, longitude: long)
    }
    
    //Set vehicle information - expecting this to only be used for Drivers
    func setVehicle(make: String, model: String, color: String, licensePlate: String){
        self.car = Vehicle()
        self.car?.make = make
        self.car?.model = model
        self.car?.color = color
        self.car?.licensePlate = licensePlate
    }
    
    //set driver's current fare
    func setFare(fare: Double) {
        self.driverFare? = fare
    }
    
    //Two seperate set functions here because Riders only need cc info and Drivers only need bank info
    func setCCInfo(ccNumber: String, ccExpDate: String, cvv: String){
        self.bankInfo = FinancialInfo()
        self.bankInfo?.ccNumber = ccNumber
        self.bankInfo?.ccExpDate = ccExpDate
        self.bankInfo?.cvv = cvv
    }
    
    func setBankInfo(bankName: String, bankAccountNumber: String, bankRoutingNumber: String){
        self.bankInfo = FinancialInfo()
        self.bankInfo?.bankName = bankName
        self.bankInfo?.bankAccountNumber = bankAccountNumber
        self.bankInfo?.bankRoutingNumber = bankRoutingNumber
    }
    
//    func addTrip(startLocation: Location, destination: Location, fare: Double){
//        guard let trips = self.previousTrips else {
//            self.previousTrips = Array<Trip>()
//
//        }
//    }
    
    //func getUser(username: String) -> UniUser{
    //    let user = ref.child("uni-user").queryEqual(toValue: "cookr")
    //
    //    return user
    //}

}

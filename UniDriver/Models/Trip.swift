//
//  Trip.swift
//  UniDriver
//
//  Created by user155127 on 11/17/19.
//  Copyright © 2019 Robert Cook. All rights reserved.
//

import Foundation
import Firebase

class Trip{
    var tripStartDate: Date
    var tripEndDate: Date
    var startLocation: Location
    var destination: Location
    var fare: Double
    var tripCost: Double
    var isActive = false
    var isComplete = false
    var driverUserName: String
    var riderUserName: String
    
    func toAnyObject() -> Any{
        return [
            "tripStartDate": tripStartDate.description,
            "tripEndDate": tripEndDate.description,
            "startLocation": [startLocation.toAnyObject()],
            "destination": [destination.toAnyObject()],
            "fare": fare.description,
            "tripCost": tripCost.description,
            "isActive": isActive.description,
            "isComplete": isComplete.description,
            "driverUserName": driverUserName,
            "riderUserName": riderUserName
        ]
    }
    
    init(){
        self.startLocation = Location()
        self.destination = Location()
        self.fare = 0.00
        self.tripStartDate = Date()
        self.tripEndDate = Date()
        self.tripCost = 0.00
        self.driverUserName = ""
        self.riderUserName = ""
    }
    
    init?(value: [String: AnyObject], ref: DatabaseReference?, key: String) {
        guard
            let fare = Double(value["fare"] as! String),
            let tripStartDateString = value["tripStartDate"] as? String,
            let tripEndDateString = value["tripEndDate"] as? String,
            let tripCost = Double(value["tripCost"] as! String),
            let driverUserName = value["driverUserName"] as? String,
            let riderUserName = value["riderUserName"] as? String,
            let isActiveString = value["isActive"] as? String,
            let isCompleteString = value["isComplete"] as? String
            else { return nil }
        
        self.fare = fare
        self.tripCost = tripCost
        self.driverUserName = driverUserName
        self.riderUserName = riderUserName
        self.isActive = (isActiveString == "true")
        self.isComplete = (isCompleteString == "true")
        
        let dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        self.tripStartDate = dateFormatter.date(from: tripStartDateString)!
        self.tripEndDate = dateFormatter.date(from: tripEndDateString)!
        self.startLocation = Location()
        self.destination = Location()
        
        if let locationInfoArray = value["startLocation"] as? NSMutableArray,
            let locationInfo = locationInfoArray[0] as? [String: AnyObject],
            let lat = Double(locationInfo["latitude"] as! String),
            let long = Double(locationInfo["longitude"] as! String) {
            self.startLocation = Location(latitude: lat, longitude: long)
        }
        
        if let locationInfoArray = value["destination"] as? NSMutableArray,
            let locationInfo = locationInfoArray[0] as? [String: AnyObject],
            let lat = Double(locationInfo["latitude"] as! String),
            let long = Double(locationInfo["longitude"] as! String) {
            self.destination = Location(latitude: lat, longitude: long)
        }
    }
    
    /*
    init?(snapshot: DataSnapshot){
        
    }
    */
}

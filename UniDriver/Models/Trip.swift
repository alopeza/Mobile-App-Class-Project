//
//  Trip.swift
//  UniDriver
//
//  Created by user155127 on 11/17/19.
//  Copyright © 2019 Robert Cook. All rights reserved.
//

import Foundation

class Trip{
    var tripStartDate: Date
    var tripEndDate: Date
    var startLocation: Location
    var destination: Location
    var fare: Double
    var tripCost: Double
    
    func toAnyObject() -> Any{
        return [
            "tripStartDate": tripStartDate.description,
            "tripEndDate": tripEndDate.description,
            "startLocation": [startLocation.toAnyObject()],
            "destination": [destination.toAnyObject()],
            "fare": fare.description,
            "tripCost": tripCost.description
        ]
    }
    
    init(){
        self.startLocation = Location()
        self.destination = Location()
        self.fare = 0.00
        self.tripStartDate = Date()
        self.tripEndDate = Date()
        self.tripCost = 0.00
    }
    
}

//
//  Trip.swift
//  UniDriver
//
//  Created by user155127 on 11/17/19.
//  Copyright © 2019 Robert Cook. All rights reserved.
//

import Foundation

class Trip{
    var tripDate: Date
    var startLocation: Location
    var destination: Location
    var fare: Double
    
    func toAnyObject() -> Any{
        return [
            "tripDate": tripDate.description,
            "startLocation": [startLocation.toAnyObject()],
            "destination": [destination.toAnyObject()],
            "fare": fare.description
        ]
    }
    
    init(){
        self.startLocation = Location()
        self.destination = Location()
        self.fare = 0.00
        self.tripDate = Date()
    }
    
}

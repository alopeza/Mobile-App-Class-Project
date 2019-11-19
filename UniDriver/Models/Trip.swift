//
//  Trip.swift
//  UniDriver
//
//  Created by user155127 on 11/17/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import Foundation

struct Trip{
    var tripDate: Date
    var startLocation: Location
    var destination: Location
    var fare: Double
    
    func toAnyObject() -> Any{
        return [
            "tripDate": tripDate,
            "startLocation": startLocation,
            "destination": destination,
            "fare": fare
        ]
    }
}

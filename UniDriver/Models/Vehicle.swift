//
//  Vehicle.swift
//  UniDriver
//
//  Created by user155127 on 11/17/19.
//  Copyright © 2019 Robert Cook. All rights reserved.
//

import Foundation

class Vehicle{
    var make: String?
    var model: String?
    var color: String?
    var licensePlate: String?
    
    func toAnyObject() -> Any{
        return [
            "make": make,
            "model": model,
            "color": color,
            "licensePlate": licensePlate
        ]
    }
    
}

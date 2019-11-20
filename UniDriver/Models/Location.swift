//
//  Location.swift
//  UniDriver
//
//  Created by user155127 on 11/17/19.
//  Copyright © 2019 Robert Cook. All rights reserved.
//

import Foundation

class Location{
    var latitude: Double
    var longitude: Double
    
    init(){
        latitude = 0.00
        longitude = 0.00
    }
    
    init(latitude: Double, longitude: Double){
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func toAnyObject() -> Any{
        return [
            "latitude": latitude.description,
            "longitude": longitude.description
        ]
    }
}

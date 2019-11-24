//
//  FinancialInfo.swift
//  UniDriver
//
//  Created by user155127 on 11/17/19.
//  Copyright © 2019 Robert Cook. All rights reserved.
//

import Foundation

class FinancialInfo{
    var ccNumber: String?
    var ccExpDate: String?
    var cvv: String?
    var bankAccountNumber: String?
    var bankRoutingNumber: String?
    
    func toAnyObject() -> Any{
        return [
            "ccNumber": ccNumber,
            "ccExpDate": ccExpDate,
            "cvv": cvv,
            "bankAccountNumber": bankAccountNumber,
            "bankRoutingNumber": bankRoutingNumber
        ]
    }
}

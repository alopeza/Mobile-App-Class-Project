//
//  FinancialInfo.swift
//  UniDriver
//
//  Created by user155127 on 11/17/19.
//  Copyright © 2019 Zachary Garlett. All rights reserved.
//

import Foundation

struct FinancialInfo{
    var ccNumber: String
    var ccExpDate: String
    var bankName: String
    var bankAccountNumber: String
    var bankRoutingNumber: String
    
    func toAnyObject() -> Any{
        return [
            "ccNumber": ccNumber,
            "ccExpData": ccExpDate,
            "bankName": bankName,
            "bankAccountNumber": bankAccountNumber,
            "bankRoutingNumber": bankRoutingNumber
        ]
    }
}

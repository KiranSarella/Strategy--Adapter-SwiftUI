//
//  UPIPaymentService.swift
//  Strategy-SwiftUI
//
//

import Foundation

struct UPIPaymentResponse {
    let message: String
}

class UPIPaymentService {
 
    func doPayment(amount: Double, upiNumber: String) throws -> UPIPaymentResponse {
        print(#function)
        return UPIPaymentResponse(message: "Success")
    }
    
    func validate(upiNumber: String) -> Bool {
        print(#function)
        return true
    }
}


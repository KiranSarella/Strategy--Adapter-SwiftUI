//
//  ApplePayPaymentService.swift
//  Strategy-SwiftUI
//
//

import Foundation

struct ApplePayPaymentResponse {
    let message: String
}

class ApplePayPaymentService {
 
    func doPayment(amount: Double) throws -> ApplePayPaymentResponse {
        print(#function)
        return ApplePayPaymentResponse(message: "Success")
    }
    
    func canMakePayment() -> Bool {
        print(#function)
        return true
    }
}

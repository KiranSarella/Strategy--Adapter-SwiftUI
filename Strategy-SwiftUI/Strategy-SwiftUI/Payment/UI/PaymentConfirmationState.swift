//
//  PaymentConfirmationState.swift
//  Strategy-SwiftUI
//
//

import SwiftUI

@Observable
class PaymentConfirmationState {
    
    var paymentStatus: Bool?
    
    var paymentStatusMessage: String {
        guard let paymentStatus = paymentStatus else { return "None" }
        
        if paymentStatus {
            return "Payment Successful."
        } else {
            return "Payment Failed."
        }
    }
    
    func doPayment(item: Item, business: PaymentBusiness) {
        Task {
            paymentStatus = await business.doPayment(for: item)
        }
    }
    
}

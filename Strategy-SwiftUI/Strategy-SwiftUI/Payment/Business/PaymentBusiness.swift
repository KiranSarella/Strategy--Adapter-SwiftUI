//
//  PaymentBusiness.swift
//  Strategy-SwiftUI
//
//

import Foundation

enum PaymentMethod: CaseIterable {
    case upi
    case netBanking
    case applePay
    
    var name: String {
        switch self {
        case .upi:
            "UPI"
        case .netBanking:
            "Net Banking"
        case .applePay:
            "Apple Pay"
        }
    }
}

class PaymentBusiness {
    
    private(set) var paymentMethod: PaymentMethod = .upi
    private var paymentService: PaymentServiceProvider = UPIPayment()
    
    func doPayment(for item: Item) async -> Bool {
        do {
            let response = try await paymentService.doPayment(amount: item.price)
            print(response)
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func update(paymentMethod newValue: PaymentMethod) {
        paymentMethod = newValue
        
        switch paymentMethod {
        case .upi:
            paymentService = UPIPayment()
        case .netBanking:
            paymentService = NetBanking()
        case .applePay:
            paymentService = ApplePay()
        }
    }
    
}

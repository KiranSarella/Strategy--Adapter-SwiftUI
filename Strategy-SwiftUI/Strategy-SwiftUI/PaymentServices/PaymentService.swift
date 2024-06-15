//
//  PaymentService.swift
//  Strategy-SwiftUI
//
//

import Foundation

struct PaymentTransaction {
    let id: UUID = UUID()
    let amount: Double
    let message: String
}

protocol PaymentServiceProvider {
    
    func doPayment(amount: Double) async throws -> PaymentTransaction
}

// MARK: - Adapters
class UPIPayment: PaymentServiceProvider {
    let paymentMethod = UPIPaymentService()
    let userProfile = UserProfile()
    
    func doPayment(amount: Double) async throws -> PaymentTransaction {
        let response = try paymentMethod.doPayment(amount: amount, upiNumber: userProfile.getUPINumber())
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return PaymentTransaction(amount: amount, message: response.message)
    }
}

class NetBanking: PaymentServiceProvider {
    let paymentMethod = NetBankingPaymentService()
    let userProfile = UserProfile()
    
    func doPayment(amount: Double) async throws -> PaymentTransaction {
        let response = try paymentMethod.doPayment(amount: amount, bankDetail: userProfile.bankDetail())
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return PaymentTransaction(amount: amount, message: response.message)
    }
}

class ApplePay: PaymentServiceProvider {
    let paymentMethod = ApplePayPaymentService()
    let userProfile = UserProfile()
    
    func doPayment(amount: Double) async throws -> PaymentTransaction {
        let response = try paymentMethod.doPayment(amount: amount)
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return PaymentTransaction(amount: amount, message: response.message)
    }
}

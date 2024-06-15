//
//  NetBankingPaymentService.swift
//  Strategy-SwiftUI
//

import Foundation

struct BankDetail {
    let accountNumber: String
    let ifscCode: String
}

extension BankDetail: CustomStringConvertible {
    var description: String {
        "Account Number: \(accountNumber) \n IFSC Code: \(ifscCode)"
    }
}

struct NetBankingPaymentResponse {
    let message: String
}

class NetBankingPaymentService {
 
    func doPayment(amount: Double, bankDetail: BankDetail) throws -> NetBankingPaymentResponse {
        print(#function)
        return NetBankingPaymentResponse(message: "Success")
    }
    
    func validate(bankDetail: BankDetail) -> Bool {
        print(#function)
        return true
    }
}

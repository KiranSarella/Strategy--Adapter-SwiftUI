//
//  PaymentOptionsState.swift
//  Strategy-SwiftUI
//
//

import SwiftUI

@Observable
class PaymentOptionsState {
    
    var selectedPaymentType: PaymentMethod? = .upi
    
    var selectedItem: Item = Item(name: "PQ Ridiculus", price: 2499)
    
    func updatePaymentType(in business: inout PaymentBusiness) {
        guard let selectedPaymentType = selectedPaymentType else { return }
        business.update(paymentMethod: selectedPaymentType)
    }
    
}

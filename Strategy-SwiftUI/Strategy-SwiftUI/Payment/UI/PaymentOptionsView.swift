//
//  PaymentOptionsView.swift
//  Strategy-SwiftUI
//
//

import SwiftUI

struct PaymentOptionsView: View {
    
    @Binding var business: PaymentBusiness
    @State private var state = PaymentOptionsState()
    @State private var showPaymentConfirmation = false
    
    var body: some View {
        List(selection: $state.selectedPaymentType) {
            Section("Choose payment method") {
                ForEach(PaymentMethod.allCases, id: \.self) { p in
                    Text(p.name)
                }
            }
        }
        .toolbar(content: {
            Button("Continue") {
                showPaymentConfirmation = true
            }
        })
        .onChange(of: state.selectedPaymentType, { oldValue, newValue in
            state.updatePaymentType(in: &business)
        })
        .navigationDestination(isPresented: $showPaymentConfirmation) {
            PaymentConfirmationView(business: $business, item: state.selectedItem, paymentMethod: state.selectedPaymentType!)
        }
    }
}

//#Preview {
//    PaymentOptionsView()
//}

//
//  PaymentConfirmationView.swift
//  Strategy-SwiftUI
//
//

import SwiftUI


struct PaymentConfirmationView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var business: PaymentBusiness
    let userProfile = UserProfile()
    let item: Item
    let paymentMethod: PaymentMethod
    
    @State private var state = PaymentConfirmationState()
    @State private var showPaymentStatus = false
    
    
    var info: String {
        switch paymentMethod {
        case .upi:
            return userProfile.getUPINumber()
        case .netBanking:
            return userProfile.bankDetail().description
        case .applePay:
            return ""
        }
    }
    
    var body: some View {
        List {
            Section {
                LabeledContent("Name", value: item.name)
                LabeledContent("Price", value: "₹ " + round(item.price).description)
                LabeledContent("Payment Method", value: paymentMethod.name)
            } footer: {
                HStack {
                    Spacer()
                    Text(info)
                        .font(.caption)
                    Spacer()
                }
            }
        }
        .navigationTitle("Confirm Payment")
        .onAppear(perform: {
            state.paymentStatus = nil
        })
        .toolbar {
            Button {
                state.doPayment(item: item, business: business)
            } label: {
                Text("Pay")
            }
        }
        .onChange(of: state.paymentStatus) { oldValue, newValue in
            guard newValue != nil else { return }
            showPaymentStatus = true
        }
        .alert(state.paymentStatusMessage, isPresented: $showPaymentStatus) {
            Button("Thanks!") {
                dismiss()
            }
        }
    }
}

//#Preview {
//    PaymentConfirmationView()
//}

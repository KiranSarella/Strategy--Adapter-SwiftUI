//
//  ContentView.swift
//  Strategy-SwiftUI
//
//

import SwiftUI

struct ContentView: View {
    
    @State private var paymentBusiness = PaymentBusiness()
    
    var body: some View {
        NavigationStack {
            PaymentOptionsView(business: $paymentBusiness)
//                .navigationTitle("Payment methods")
//                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    ContentView()
}

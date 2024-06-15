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
        }
        
    }
}

#Preview {
    ContentView()
}

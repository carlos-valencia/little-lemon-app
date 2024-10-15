//
//  ReservationForm.swift
//  Little Lemon
//
//  Created by Carlos Valencia on 10/11/24.
//

import SwiftUI

struct ReservationForm: View {
    var body: some View {
        @State var customerName: String = ""
        @State var phoneNumber: String = ""
        
        Form {
            TextField("Type your name",
                      text: $customerName,
                      onEditingChanged: {status in
                print(status)
            })
            .onChange(of: customerName, {
                print(customerName)
            })
            .onSubmit({
                print("Submitted")
            })
            
            TextField("Type in your phone number", text: $phoneNumber)
        }
    }
}

#Preview {
    ReservationForm()
}

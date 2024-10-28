//
//  SpecialRequestView.swift
//  Little Lemon
//
//  Created by Carlos Valencia on 10/24/24.
//

import SwiftUI

struct SpecialRequestView: View {
    @Binding var specialRequest: String
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter special requests with as much detail as necessary")) {
                    TextEditor(text: $specialRequest)
                        .frame(height: 160)
                }
            }
            //.navigationTitle("Special Requests")
        }
    }
}

#Preview {
    SpecialRequestView(specialRequest: .constant("None"))
}

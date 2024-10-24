//
//  ReservationFormView.swift
//  Little Lemon
//
//  Created by Carlos Valencia on 10/23/24.
//

import SwiftUI
import Combine

struct ReservationFormView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var guests: Int = 1
    @State private var reservationDate = Date()
    @State private var reservationTime = Date()
    @State private var hasSpecialRequest: Bool = true
    @State private var specialRequest: String = ""
    private let specialRequestDefault: String = "Leave your special request here. Provide as much detail as needed."
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComppnents = DateComponents()
        let endComponents = DateComponents()
        return calendar.date(from: startComppnents)!
            ...
            calendar.date(from: endComponents)!
    }()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")){
                    
                    HStack {
                        Text("First Name:")
                        Spacer()
                        TextField("First name", text: $firstName, prompt: Text("Required"))
                    }
                    
                    HStack {
                        Text("Last Name:")
                        TextField("Last Name", text: $lastName, prompt: Text("Required"))
                    }
                }
                    
                Section(header: Text("Reservation details")){
                    
                    Stepper("Number of guests: \(guests) (Max: 10)", value: $guests, in: 1...10)
                    
                    DatePicker("Reservation date", selection: $reservationDate, displayedComponents: [.date])
                
                    DatePicker("Reservation time", selection: $reservationTime, displayedComponents: [.hourAndMinute])
                    
                }
                
                Section(header: Text("Special Requests")) {
                    Toggle("Special Requests", isOn: $hasSpecialRequest)
                    
                    if hasSpecialRequest {
                        Text("Leave your special request below. Provide as much detail as needed.")
                        TextEditor(text: $specialRequest)
                    }
                    
                }
                
                
                Button(action: {
                    print("Table reserved")
                }){
                    Text("Reserve a table")
                }
            }
            .navigationTitle("Reserve a table")
        }
    }
}

#Preview {
    ReservationFormView()
}

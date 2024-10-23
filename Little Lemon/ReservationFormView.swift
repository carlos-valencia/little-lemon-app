//
//  ReservationFormView.swift
//  Little Lemon
//
//  Created by Carlos Valencia on 10/23/24.
//

import SwiftUI
import Combine

struct ReservationFormView: View {
    
    @State private var name: String = ""
    @State private var numberOfGuests: Int?
    @State private var reservationDate = Date()
    @State private var reservationTime = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComppnents = DateComponents()
        let endComponents = DateComponents()
        return calendar.date(from: startComppnents)!
            ...
            calendar.date(from: endComponents)!
    }()
    
    var body: some View {
        Form {
            VStack {
                
                HStack {
                    DatePicker("Reservation date", selection: $reservationDate, displayedComponents: [.date])
                    Button(action: {
                        print("checking availability")
                    }) {
                        Image(systemName: "")
                    }
                }
                
                Divider()
                
                HStack {
                    Text("Enter your name:")
                    Spacer()
                    TextField("Enter your name", text: $name, prompt: Text("Required"))
                }
                
                Divider()
                
                HStack {
                    Text("Number of guests")
                    Spacer()
                    TextField("Enter number of guests", value: $numberOfGuests, format: .number, prompt: Text("Required"))
                        .keyboardType(.numberPad)
                }
                
                Divider()
                
                HStack {
                    DatePicker("Reservation time", selection: $reservationTime, displayedComponents: [.hourAndMinute])
                }
                
                Spacer()
                
                Button("Confirm Reservation") {
                    print("reservation confirmed")
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    ReservationFormView()
}

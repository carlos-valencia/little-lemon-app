//
//  ReservationCalendar.swift
//  Little Lemon
//
//  Created by Carlos Valencia on 10/16/24.
//

import SwiftUI

struct ReservationCalendar: View {
    
    @State var reservationDate = Date()
    
    var body: some View {
        Form {
            HStack {
                DatePicker(
                    selection: $reservationDate, in: Date()...,
                    displayedComponents: [.date, .hourAndMinute]
                ) {}
                Button(action: { print("do something") }) {
                    HStack {
                        Image(systemName: "arrow.right.circle")
                        Text("Done")
                    }
                }.padding(20)
                
            }
            Text("Reservation date is \(reservationDate.formatted(date: .long, time: .complete))")
        }
    }
}

#Preview {
    ReservationCalendar()
}

//
//  ReservationCalendar.swift
//  Little Lemon
//
//  Created by Carlos Valencia on 10/16/24.
//

import SwiftUI

struct ReservationCalendar: View {
    
    @State var selectedDate = Date()
    
    var body: some View {
        Form {
            HStack {
                DatePicker(
                    selection: $selectedDate,
                    label: { Text("Reservation Date") })
                Button(
                    action: {
                        
                    }, label: {
                        Text("Done")
                    })
                
            }
        }
    }
}

#Preview {
    ReservationCalendar()
}

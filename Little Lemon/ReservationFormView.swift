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
    @State private var email: String = ""
    @State private var phoneNumber: Int?
    @State private var guests: Int = 1
    @State private var reservationDate = Date()
    @State private var hasSpecialRequest: Bool = true
    @State private var specialRequest: String = ""
    
    enum InputType {
        case String
        case Email
        case PhoneNumber
    }
    
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
            ZStack (alignment: .bottom){
                Form {
                    PersonalInformationSectionView(firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber)
                    
                    ReservationDetailsSectionView(guests: $guests, reservationDate: $reservationDate)
                    
                    SpecialRequestSectionView(hasSpecialRequest: $hasSpecialRequest, specialRequest: $specialRequest)
                }
                
                Button(action: {
                    print("Table reserved")
                }){
                    Text("Confirm Reservation")
                        .font(.title3)
                        .padding(8)
                }
                .buttonStyle(.borderedProminent)
                
            }
            .navigationTitle("Reserve a table")
        }
        .accentColor(.sageGreen)
    }
}

struct SpecialRequestSectionView: View {
    
    @Binding var hasSpecialRequest: Bool
    @Binding var specialRequest: String
    
    var body: some View {
        Section(header: Text("Special Requests")) {
            Toggle(isOn: $hasSpecialRequest) {
                Text("Special Requests")
            }
            .toggleStyle(SwitchToggleStyle(tint: .sageGreen))
            NavigationLink("Special Request Details", destination: SpecialRequestView(specialRequest: $specialRequest))
                .disabled(!hasSpecialRequest)
            
        }
    }
}

struct ReservationDetailsSectionView: View {
    
    @Binding var guests: Int
    @Binding var reservationDate: Date
    
    var body: some View {
        Section(header: Text("Reservation details")){
            
            Stepper("Number of guests: \(guests) (Max: 10)", value: $guests, in: 1...10)
            
            DatePicker("Reservation date", selection: $reservationDate, displayedComponents: [.date])
        
            DatePicker("Reservation time", selection: $reservationDate, displayedComponents: [.hourAndMinute])
            
        }
    }
}

struct PersonalInformationSectionView: View {
    
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var phoneNumber: Int?
    
    var body: some View {
        Section(header: Text("Personal Information")){
            
            InputLineView(label: "First Name", value: $firstName)
            
            InputLineView(label: "Last Name", value: $lastName)
            
            InputLineView(label: "Email", value: $email)
                .keyboardType(.emailAddress)
            
            HStack {
                Text("Phone Number:")
                TextField("Phone Number", value: $phoneNumber, format: .number, prompt: Text("Required"))
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.trailing)
            }
            
        }
    }
}

struct InputLineView: View {
    
    let label: String
    @Binding var value: String
    
    var body: some View {
        HStack {
            Text("\(label):")
            TextField(label, text: $value, prompt: Text("Required"))
                .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    ReservationFormView()
}

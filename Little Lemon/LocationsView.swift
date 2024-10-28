//
//  LocationsView.swift
//  Little Lemon
//
//  Created by Carlos Valencia on 10/28/24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @ObservedObject private var locationModel = LocationModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(locationModel.locations) { location in
                    LocationView(location: location)
                }
            }
        }
    }
}

struct LocationView: View {
    
    let location: RestaurantLocation
    
    var body: some View {
        VStack (alignment: .leading){
            Text(location.locationName)
                .font(.title3)
            Text(location.fullAddress)
                .font(.body)
                .foregroundColor(.secondary)
        }
        
    }
}


struct RestaurantLocation: Identifiable{
    let id = UUID()
    let address: String
    let city: String
    let state: String = "NH"
    var fullAddress: String {
        "\(address), \(city)"
    }
    var locationName: String {
        "Little Lemon - \(city)"
    }
    var image: Image {
        return Image(city)
    }
    
}

class LocationModel: ObservableObject {
    @Published var locations: [RestaurantLocation] = locations()
    
    static func locations() -> [RestaurantLocation] {
        return [
            RestaurantLocation(address: "220 S River Rd", city: "Bedford"),
            RestaurantLocation(address: "600 Amherst St", city: "Nashua"),
            RestaurantLocation(address: "80 D'Amante Dr", city: "Concord"),
            RestaurantLocation(address: "100 Quality Dr", city: "Hookset")
        ]
    }
}

#Preview {
    LocationsView()
}

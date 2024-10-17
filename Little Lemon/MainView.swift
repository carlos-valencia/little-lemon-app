//
//  MainView.swift
//  Little Lemon
//
//  Created by Carlos Valencia on 10/15/24.
//

import SwiftUI

struct MainView: View {
    
    let lemonYellow = Color(red: 0.9531, green: 0.8047, blue: 0.0781)
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    lemonYellow.opacity(0.5).edgesIgnoringSafeArea(.all)
                    HStack(spacing: 8){
                        Text("Demo")
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
                        VStack(spacing: 10) {
                            Text("Little Lemon").font(.title)
                            Text("Tomato Tortellini, Bottarga and Carbonara")
                                .font(.title3)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    MainView()
}

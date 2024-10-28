//
//  NavigationBarView.swift
//  Little Lemon
//
//  Created by Carlos Valencia on 10/25/24.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        ZStack {
            Color.offWhite
            HStack {
                Image(systemName: "line.3.horizontal")
                    .font(.title)
                Spacer()
                LogoView()
                Spacer()
                Image(systemName: "cart")
                    .font(.title)
            }
            .padding(20)
        }
    }
}

struct LogoView: View {
    var body: some View {
        Image("littleLemonLogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 170)
    }
}

#Preview {
    NavigationBarView()
}

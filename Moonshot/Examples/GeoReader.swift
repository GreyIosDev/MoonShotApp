//
//  GeoReader.swift
//  Moonshot
//
//  Created by Grey  on 18.10.2023.
//

import SwiftUI

// This are the important facts to note about the GeoReader-  it basically helps you understand the available space.

//It helps you understand how much space you have and use it to place and size things on your paper (or screen).



struct GeoReader: View {
    var body: some View {
        GeometryReader { geo in
            Image("aldrin")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height) // This is done when you want to center a view insider a GeometryReader
        }
    }
}

#Preview {
    GeoReader()
}

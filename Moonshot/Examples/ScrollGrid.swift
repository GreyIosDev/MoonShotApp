//
//  ScrollGrid.swift
//  Moonshot
//
//  Created by Grey  on 18.10.2023.
//

import SwiftUI

// How to use the Grid item: Think of it as a special card organizer that helps you decide how many cards should be in each row, and how big or small each card should be.
struct ScrollGrid: View {
    let layout = [
        GridItem(.adaptive(minimum: 80,maximum: 120))// We use the adaptive layouts because they allow grids that make maximum use of available screen space. The Mainimum and Maximum are the size of the width.
        ]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    ScrollGrid()
}


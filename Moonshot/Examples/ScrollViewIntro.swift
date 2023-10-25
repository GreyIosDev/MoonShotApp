//
//  ScrollViewIntro.swift
//  Moonshot
//
//  Created by Grey  on 18.10.2023.
//

import SwiftUI

// Basically ScrollVeiw helps us to be able to Scroll through arbitary data.

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ScrollViewIntro: View {
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 10) { // is like a smart list that only handles the items you're looking at, making your app more efficient and responsive when dealing with long lists of data.
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ScrollViewIntro()
}

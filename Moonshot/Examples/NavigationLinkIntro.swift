//
//  NavigationLinkIntro.swift
//  Moonshot
//
//  Created by Grey  on 18.10.2023.
//

import SwiftUI

// NavigationLink basically the same as sheet in that it allows us to show a new view from the current one.
// But note the difference is that NavigationLink is for showing details about the user's selection, like you're digging deeper into a topic
// sheet() is for showing unrelated content, such as settings or a compose window.
struct NavigationLinkIntro: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    NavigationLinkIntro()
}

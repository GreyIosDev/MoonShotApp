//
//  HomeView.swift
//  Moonshot
//
//  Created by Grey  on 23.10.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingCategories = false
    @State private var isExpanded = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        Spacer()
                        NotificationBellIcon()
                    }
                    .padding()

                    WelcomeMessage(userName: "Customer Name")

                    SearchBar()

                    ServiceCategoriesView(isExpanded: $isExpanded)

                    if isExpanded {
                        ViewMoreOption()
                    }

                    Spacer()
                }

                if isShowingCategories {
                    ServiceCategoriesPopup(isExpanded: $isExpanded, isShowingCategories: $isShowingCategories)
                        .transition(.move(edge: .bottom))
                }
            }
            .navigationBarItems(trailing: GetStartedButton(isShowingCategories: $isShowingCategories))
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

struct ServiceCategoriesView: View {
    @Binding var isExpanded: Bool

    var body: some View {
        VStack {
            Text("Service Categories")
                .font(.headline)

            ForEach(0..<5, id: \.self) { index in
                ServiceCategoryRow(category: "Category \(index + 1)")
                    .onTapGesture {
                        // Handle category selection
                    }
            }
        }
        .padding()
    }
}

struct ServiceCategoryRow: View {
    var category: String

    var body: some View {
        Text(category)
    }
}

struct WelcomeMessage: View {
    var userName: String

    var body: some View {
        Text("Hi, \(userName)")
            .font(.title)
            .padding()
    }
}

struct NotificationBellIcon: View {
    var body: some View {
        Image(systemName: "bell")
            .padding()
    }
}

struct SearchBar: View {
    var body: some View {
        // Implement your search bar here
        Text("Search Bar")
    }
}

struct ViewMoreOption: View {
    var body: some View {
        Text("View More")
            .onTapGesture {
                // Handle view more
            }
            .foregroundColor(.blue)
            .padding()
    }
}

struct GetStartedButton: View {
    @Binding var isShowingCategories: Bool

    var body: some View {
        Button(action: {
            self.isShowingCategories.toggle()
        }) {
            Text("Get Started")
                .foregroundColor(.blue)
        }
    }
}

struct ServiceCategoriesPopup: View {
    @Binding var isExpanded: Bool
    @Binding var isShowingCategories: Bool

    var body: some View {
        VStack {
            Spacer()
            ServiceCategoriesView(isExpanded: $isExpanded)
            Spacer()
            CloseButton(isShowingCategories: $isShowingCategories)
        }
        .background(Color.white)
    }
}

struct CloseButton: View {
    @Binding var isShowingCategories: Bool

    var body: some View {
        Button("Close") {
            self.isShowingCategories.toggle()
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


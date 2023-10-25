//
//  Mission.swift
//  Moonshot
//
//  Created by Grey  on 20.10.2023.
//

import Foundation

struct Mission: Codable, Identifiable { // Remeber that once you see id in your JSON file you know that the struct should conform to Identifiable.
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

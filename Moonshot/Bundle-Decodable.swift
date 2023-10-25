//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Grey  on 20.10.2023.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
            //It checks if there is a file with the given name in the app's bundle
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
            //It tries to load the data from the file specified by the URL
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter() // In this section we add the format in which the date would follow.
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
            // This line attempts to decode the data as a dictionary where the keys are strings and the values are Astronaut objects. 
        }
        
        return loaded
    }
}

//
//  CrewScrollView.swift
//  Moonshot
//
//  Created by Grey  on 25.10.2023.
//

import SwiftUI

struct CrewScrollView: View {
    struct CrewMembers {
        let role: String
        let astronaut: Astronaut
    }
    
    let crew: [CrewMembers]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMembers in
                    NavigationLink {
                        AstronautView(astronaut: crewMembers.astronaut)
                    } label: {
                        HStack {
                            Image(crewMembers.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMembers.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMembers.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct CrewScrollView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        let crewMember1 = CrewScrollView.CrewMembers(role: "Command Pilot", astronaut: astronauts["collins"]!)
        let crewMember2 = CrewScrollView.CrewMembers(role: "Pilot", astronaut: astronauts["aldrin"]!)
        
        return CrewScrollView(crew: [crewMember1, crewMember2])
            .preferredColorScheme(.dark)
    }
}


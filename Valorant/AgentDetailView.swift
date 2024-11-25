//
//  AgentDetailView.swift
//  Valorant
//
//  Created by Jatin Singh on 25/11/24.
//

import Foundation
import SwiftUI

struct AgentDetailView: View {
    let agent: Agent
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let portraitURL = (agent.fullPortrait ?? agent.displayIcon).flatMap(URL.init) {
                    AsyncImage(url: portraitURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Text(agent.description)
                    .padding(.horizontal)
                
                AbilitiesSection(abilities: agent.abilities)
            }
        }
        .navigationTitle(agent.displayName)
    }
}



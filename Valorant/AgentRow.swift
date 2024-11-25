//
//  AgentRow.swift
//  Valorant
//
//  Created by Jatin Singh on 25/11/24.
//

import Foundation
import SwiftUI

struct AgentRow: View {
    let agent: Agent
    
    var body: some View {
        HStack {
            if let iconURL = agent.displayIcon.flatMap(URL.init) {
                AsyncImage(url: iconURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading) {
                Text(agent.displayName)
                    .font(.headline)
                if let role = agent.role {
                    Text(role.displayName)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}




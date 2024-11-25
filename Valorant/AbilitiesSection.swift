//
//  AgentSectionView.swift
//  Valorant
//
//  Created by Jatin Singh on 25/11/24.
//

import Foundation
import SwiftUI

struct AbilitiesSection: View {
    let abilities: [Ability]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Abilities")
                .font(.title2)
                .padding(.horizontal)
            
            ForEach(abilities, id: \.slot) { ability in
                AbilityRow(ability: ability)
            }
        }
    }
}

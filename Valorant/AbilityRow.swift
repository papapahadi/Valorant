//
//  AbilityRow.swift
//  Valorant
//
//  Created by Jatin Singh on 25/11/24.
//

import Foundation
import SwiftUI

struct AbilityRow: View {
    let ability: Ability
    
    var body: some View {
        HStack {
            if let iconURL = ability.displayIcon.flatMap(URL.init) {
                AsyncImage(url: iconURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 40, height: 40)
            }
            
            VStack(alignment: .leading) {
                Text(ability.displayName)
                    .font(.headline)
                Text(ability.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal)
    }
}

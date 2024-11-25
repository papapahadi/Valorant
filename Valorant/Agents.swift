//
//  Agents.swift
//  Valorant
//
//  Created by Jatin Singh on 25/11/24.
//

import Foundation

struct ApiResponse: Codable {
    let status: Int
    let data: [Agent]
}

struct Agent: Codable, Identifiable {
    let uuid: String
    let displayName: String
    let description: String
    let displayIcon: String?
    let fullPortrait: String?
    let isPlayableCharacter: Bool
    let role: Role?
    let abilities: [Ability]
    
    var id: String { uuid }
    
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case displayName
        case description
        case displayIcon
        case fullPortrait
        case isPlayableCharacter
        case role
        case abilities
    }
}

struct Role: Codable {
    let displayName: String
    let displayIcon: String?
    
    enum CodingKeys: String, CodingKey {
        case displayName
        case displayIcon
    }
}

struct Ability: Codable {
    let displayName: String
    let description: String
    let displayIcon: String?
    let slot: String
    
    enum CodingKeys: String, CodingKey {
        case displayName
        case description
        case displayIcon
        case slot
    }
}

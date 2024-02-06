//
//  PokemonModel.swift
//  PokemonApp09
//
//  Created by KJ on 1/4/23.
//

import Foundation


struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Int
    let height: Int
    let attack: Int
    let defense: Int
    let description: String
}

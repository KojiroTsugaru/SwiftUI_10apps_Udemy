//
//  PokemonViewModel.swift
//  PokemonApp09
//
//  Created by KJ on 1/5/23.
//

import SwiftUI
import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemons = [Pokemon]()
    let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: baseURL) else { return }
        URLSession.shared.dataTask(with: url){
            (data, response, error) in
            
            // more code here
            guard let data = data?.parseData(removeString: "null,") else { return }
            
            guard let pokemons = try? JSONDecoder().decode([Pokemon].self, from: data)
            else { return }
            
            // store this data
            DispatchQueue.main.async {
                self.pokemons = pokemons
            }
        }.resume()
    }
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type{
        case "fire": return .orange
        case "poison": return .purple
        case "water": return .blue
        case "electric": return .yellow
        case "psychic": return .systemPink
        case "normal": return .gray
        case "ground": return .brown
        case "flying": return .cyan
        case "fairy": return .systemTeal
        default: return .white
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data?{
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}

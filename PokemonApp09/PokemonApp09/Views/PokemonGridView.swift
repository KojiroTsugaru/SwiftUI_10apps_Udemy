//
//  PokemonGridView.swift
//  PokemonApp09
//
//  Created by KJ on 1/5/23.
//

import SwiftUI

struct PokemonGridView: View {
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.pink.opacity(0.3)]), startPoint: .topTrailing, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16){
                        ForEach(viewModel.pokemons) { pokemon in
                            NavigationLink {
                                VStack{
                                    PokemonDetailView(viewModel: viewModel, pokemon: pokemon)
                                }
                            } label: {
                                PokemonCell(pokemon: pokemon, viewModel: viewModel)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Pokemon Club \(viewModel.pokemons.count)")
        }
        .accentColor(.white)
    }
}
struct PokemonGridView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGridView()
    }
}

//
//  Pokemon.swift
//  Pokedex
//
//  Created by Timur on 11/20/20.
//

import Foundation

struct PokemonList: Codable{
    var results: [Pokemon]
}

struct Pokemon: Codable{
    let name: String
    let url: String
}

struct PokemonData: Codable{
    let id: Int
    let types: [PokemonTypeEntry]
}

struct PokemonTypeEntry: Codable{
    let slot: Int
    let type: PokemonType
}

struct PokemonType: Codable{
    let name:String
    let url: String
}

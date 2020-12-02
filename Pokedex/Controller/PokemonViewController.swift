//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Timur on 12/1/20.
//

import Foundation
import UIKit

class PokemonViewController: UIViewController{
    @IBOutlet var namelabel: UILabel!
    @IBOutlet var numberlabel: UILabel!
    @IBOutlet weak var type1Label: UILabel!
    @IBOutlet weak var type2Label: UILabel!
    
    var current : Pokemon?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        type1Label.text = ""
        type2Label.text = ""
        
        guard let pokemon = current else { return }
        let url = URL(string: pokemon.url)
        
        guard let u = url else {
            return
        }
        URLSession.shared.dataTask(with: u) {(data, response, error) in
            guard let data = data else {
                return
            }
            do{
            let pokemonData = try JSONDecoder().decode(PokemonData.self, from: data)
                
                DispatchQueue.main.async {
                    self.namelabel.text = pokemon.name
                    self.numberlabel.text = String(format: "#%03d", pokemonData.id)
            
                    for typeEntry in pokemonData.types {
                        if typeEntry.slot == 1{
                            self.type1Label.text = typeEntry.type.name
                        } else if typeEntry.slot == 2{
                            self.type2Label.text = typeEntry.type.name
                        }
                    }
                }
            }
            catch let error{
                print("\(error)")
            }
        }.resume()
    }
}

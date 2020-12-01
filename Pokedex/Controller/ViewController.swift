//
//  ViewController.swift
//  Pokedex
//
//  Created by Timur on 11/18/20.
//

import UIKit

class ViewController: UITableViewController {
    
    let pokemon = [
        Pokemon(name: "Bulbasaur", number: 1),
        Pokemon(name: "Pickachu", number: 2),
        Pokemon(name: "Raichu", number: 3),
        Pokemon(name: "Pichu", number: 4),
        Pokemon(name: "Meow-Meow", number: 5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData() /// for updating data
    }
    
    // MARK: - TableView protocols
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        cell.textLabel?.text = pokemon[indexPath.row].name
        return cell
    }
    
    // MARK: - Pass data between VC
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokemonSegue"{
            if let destination = segue.destination as? PokemonViewController{
                destination.pokemon = pokemon[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
 
}



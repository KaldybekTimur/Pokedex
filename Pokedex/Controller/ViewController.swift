//
//  ViewController.swift
//  Pokedex
//
//  Created by Timur on 11/18/20.
//

import UIKit

class ViewController: UITableViewController {
    
    var pokemon: [Pokemon] = []
    
    func capitalize(of text: String) -> String{
        return text.prefix(1).uppercased() + text.dropFirst()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151")
        guard let u = url else {
            return
        }
        URLSession.shared.dataTask(with: u) { (data, response, error) in
            guard let data = data else {
                return
            }
            do{
            let pokemonList = try JSONDecoder().decode(PokemonList.self, from: data)
                self.pokemon = pokemonList.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch let error{
                print("\(error)")
            }
        }.resume()
    }
    
    // MARK: - TableView protocols
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        cell.textLabel?.text = capitalize(of:pokemon[indexPath.row].name)
        return cell
    }
    
    // MARK: - Pass data between VC
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokemonSegue"{
            if let destination = segue.destination as? PokemonViewController{
                destination.current = pokemon[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
 
}



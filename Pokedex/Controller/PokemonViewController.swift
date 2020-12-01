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
    var pokemon : Pokemon!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namelabel.text = pokemon.name
        numberlabel.text = String(format: "#%03d", pokemon.number)
        
    }
}

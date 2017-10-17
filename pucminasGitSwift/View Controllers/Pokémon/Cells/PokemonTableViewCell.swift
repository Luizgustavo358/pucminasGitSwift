//
//  PokemonTableViewCell.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 16/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var pokemonNameLabel: UILabel!

    // MARK: - Members
    
    var pokemonResource: PokemonResource? {
        didSet {
            self.setupUI()
        }
    }
    
    // MARK: - Private
    
    func setupUI() {
        guard let pokemonResource = self.pokemonResource else { return }
        self.pokemonNameLabel.text = pokemonResource.name.uppercaseFirst
    }
}

//
//  PokemonDetailsViewController.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 16/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import UIKit
import SVProgressHUD
import Lightbox

class PokemonDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    @IBOutlet weak var pokemonWeightLabel: UILabel!
    @IBOutlet weak var pokemonHeightLabel: UILabel!
    
    // MARK: - Members
    
    var dataSource = [URL]()
    var pokemonResource: PokemonResource?
    var pokemon: Pokemon? {
        didSet {
            self.setupPokemon()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: - Private
    
    func setup() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        guard let pokemonResource = self.pokemonResource else { return }
        self.title = pokemonResource.name.uppercaseFirst
        self.requestPokemon(url: pokemonResource.url)
    }
    
    func setupPokemon() {
        guard let pokemon = self.pokemon else { return }
        self.pokemonWeightLabel.text = "Peso: \(pokemon.weight)"
        self.pokemonHeightLabel.text = "Altura: \(pokemon.height)"
        
        if pokemon.types.count == 1 {
            self.pokemonTypeLabel.text = "Tipo: " + pokemon.types[0].name.uppercaseFirst
        } else {
            self.pokemonTypeLabel.text = ""
            for type in pokemon.types {
                if (self.pokemonTypeLabel.text?.isEmpty)! {
                    self.pokemonTypeLabel.text = type.name.uppercaseFirst + ", "
                } else {
                    self.pokemonTypeLabel.text = self.pokemonTypeLabel.text! + type.name + ", "
                }
            }
            self.pokemonTypeLabel.text = String(describing: self.pokemonTypeLabel.text!.dropLast(2))
        }
        
        for sprite in pokemon.sprites.sprites {
            if let sprite = sprite {
                self.dataSource.append(sprite)
            }
        }
        self.collectionView.reloadData()
    }
    
    func requestPokemon(url: URL) {
        SVProgressHUD.show()
        PokemonService.pokemon(url: url) { (error, pokemon) in
            SVProgressHUD.dismiss()
            if let pokemon = pokemon as? Pokemon {
                self.pokemon = pokemon
            }
        }
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension PokemonDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "spriteCell", for: indexPath as IndexPath) as! PokemonDetailsCollectionViewCell
        cell.spriteURL = self.dataSource[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

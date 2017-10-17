//
//  StarWarsTableViewCell.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 15/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import UIKit

class StarWarsTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    @IBOutlet weak var characterBirthYearLabel: UILabel!
    @IBOutlet weak var characterMoviesLabel: UILabel!
    
    // MARK: - Members
    
    var character: People? {
        didSet {
            self.setupUI()
        }
    }
    
    // MARK: - Private
    
    func setupUI() {
        guard let character = self.character else { return }
        self.characterNameLabel.text = character.name
        
        if character.birthYear == "unknown" {
            self.characterBirthYearLabel.text = "Ano de nascimento desconhecido"
        } else {
        self.characterBirthYearLabel.text = "Nascido no ano \(character.birthYear)"
        }
        
        if character.films.count > 1 {
            self.characterMoviesLabel.text = "Aparece em \(character.films.count) filmes"
        } else {
            self.characterMoviesLabel.text = "Aparece em \(character.films.count) filme"
        }
        
        switch character.gender {
        case "male":
            self.characterGenderLabel.text = "Masculino"
            break
        case "female":
            self.characterGenderLabel.text = "Feminino"
            break
        default:
            self.characterGenderLabel.text = "N/A"
        }
    }
}

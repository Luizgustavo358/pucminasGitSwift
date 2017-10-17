//
//  PokemonDetailsCollectionViewCell.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 17/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonDetailsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var spriteImageView: UIImageView!
    
    // MARK: - Members
    
    var spriteURL: URL? {
        didSet {
            self.setupUI()
        }
    }
    
    // MARK: - Private
    
    func setupUI() {
        guard let spriteURL = self.spriteURL else { return }
        self.spriteImageView.sd_setImage(with: spriteURL, completed: nil)
    }
}

//
//  Pokemon.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 16/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import Foundation

struct Pokemon: Mappable {
    
    var name: String
    var height: Int
    var weight: Int
    var sprites: Sprites
    var types: [Type]
    
    init(mapper: Mapper) {
        self.name = mapper.keyPath("name")
        self.height = mapper.keyPath("height")
        self.weight = mapper.keyPath("weight")
        self.sprites = mapper.keyPath("sprites")
        self.types = mapper.keyPath("types")
    }
}

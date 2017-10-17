//
//  PokemonResource.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 16/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import Foundation

struct PokemonResource: Mappable {
    
    var url: URL
    var name: String
    
    init(mapper: Mapper) {
        self.url = mapper.keyPath("url")
        self.name = mapper.keyPath("name")
    }
}

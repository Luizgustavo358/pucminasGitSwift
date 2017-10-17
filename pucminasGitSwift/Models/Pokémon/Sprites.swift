//
//  Sprites.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 17/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import Foundation

struct Sprites: Mappable {
    
    var sprites: [URL?]
    
    init(mapper: Mapper) {
        let backFemale: URL? = mapper.keyPath("back_female")
        let backShinyFemale: URL? = mapper.keyPath("back_shiny_female")
        let backDefault: URL? = mapper.keyPath("back_default")
        let frontFemale: URL? = mapper.keyPath("front_female")
        let frontShinyFemale: URL? = mapper.keyPath("front_shiny_female")
        let backShiny: URL? = mapper.keyPath("back_shiny")
        let frontDefault: URL? = mapper.keyPath("front_default")
        let frontShiny: URL? = mapper.keyPath("front_shiny")
        
        self.sprites = [backFemale, backShinyFemale, backDefault, frontFemale, frontShinyFemale, backShiny, frontDefault, frontShiny]
    }
}

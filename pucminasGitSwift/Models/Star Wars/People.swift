//
//  People.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 15/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import Foundation

struct People: Mappable {
    
    var name: String
    var height: Int?
    var mass: Int?
    var hairColor: String
    var skinColor: String
    var eyeColor: String
    var birthYear: String
    var gender: String
    var homeworld: URL
    var films: [String]
    var species: [String]
    var vehicles: [String]
    var starships: [String]
    
    init(mapper: Mapper) {
        self.name = mapper.keyPath("name")
        self.height = mapper.keyPath("height")
        self.mass = mapper.keyPath("mass")
        self.hairColor = mapper.keyPath("hair_color")
        self.skinColor = mapper.keyPath("skin_color")
        self.eyeColor = mapper.keyPath("eye_color")
        self.birthYear = mapper.keyPath("birth_year")
        self.gender = mapper.keyPath("gender")
        self.homeworld = mapper.keyPath("homeworld")
        self.films = mapper.keyPath("films")
        self.species = mapper.keyPath("species")
        self.vehicles = mapper.keyPath("vehicles")
        self.starships = mapper.keyPath("starships")
    }
    
}

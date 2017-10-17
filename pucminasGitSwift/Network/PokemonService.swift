//
//  PokemonService.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 16/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import Foundation
import Alamofire

class PokemonService {
    static func pokemonResources(offset: Int, completion: @escaping ResponseBlock) {
        Alamofire.request("http://pokeapi.co/api/v2/pokemon/?offset=\(offset)").responseJSON { (response) in
            if let response = response.result.value as? JSONDictionary {
                if let results = response["results"] as? JSONArray {
                    var pokemonResources = [PokemonResource]()
                    for result in results {
                        let pokemonResource = PokemonResource(dictionary: result)
                        pokemonResources.append(pokemonResource)
                    }
                    completion(nil, pokemonResources)
                }
            }
        }
    }
    
    static func pokemon(url: URL, completion: @escaping ResponseBlock) {
        Alamofire.request(url).responseJSON { (response) in
            if let response = response.result.value as? JSONDictionary {
                let pokemon = Pokemon(dictionary: response)
                completion(nil, pokemon)
            }
        }
    }
}

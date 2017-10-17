//
//  StarWarsService.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 15/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import Alamofire

class StarWarsService {
    static func characters(page: Int, completion: @escaping ResponseBlock) {
        Alamofire.request("https://swapi.co/api/people/?page=\(page)").responseJSON { (response) in
            if let response = response.result.value as? JSONDictionary {
                if let results = response["results"] as? JSONArray {
                    var people = [People]()
                    for result in results {
                        let character = People(dictionary: result)
                        people.append(character)
                    }
                    completion(nil, people)
                }
            }
        }
    }
}

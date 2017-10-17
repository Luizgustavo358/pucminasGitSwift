//
//  Type.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 17/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import Foundation

struct Type: Mappable {
    
    var name: String
    
    init(mapper: Mapper) {
        self.name = mapper.keyPath("type.name")
    }
}

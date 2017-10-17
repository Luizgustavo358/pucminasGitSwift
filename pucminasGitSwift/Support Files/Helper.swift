//
//  Helper.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 16/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import Foundation

extension String {
    var first: String {
        return String(characters.prefix(1))
    }
    
    var last: String {
        return String(characters.suffix(1))
    }
    
    var uppercaseFirst: String {
        return first.uppercased() + String(characters.dropFirst())
    }
}

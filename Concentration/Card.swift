//
//  Card.swift
//  Concentration
//
//  Created by YinYifei on 2018-02-11.
//  Copyright © 2018 Yifei Yin. All rights reserved.
//

import Foundation

struct Card
{
    
    static var currentIdentifierIndex = 0
    
    static func ResetUniqueIdentifier() {
        currentIdentifierIndex = 0
    }
    
    static func GetUniqueIdentifier() -> Int {
        currentIdentifierIndex += 1
        return currentIdentifierIndex
    }
    
    init(identifier: Int) {
        self.identifier = identifier
    }
    
    var isFaceUp = false
    var isHidden = false
    var identifier: Int
}

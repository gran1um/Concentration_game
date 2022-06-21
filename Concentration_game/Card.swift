//
//  Card.swift
//  Concentration_game
//
//  Created by Alexander Popov on 20.06.2022.
//

import Foundation

struct Card{
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
}

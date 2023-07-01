//
//  Card.swift
//  Card
//
//  Created by Jing Han on 2023/3/17.
//

import Foundation

struct Card: Hashable
{
    var hashValue: Int {
        return identifier
    }
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier:Int // use ID not emoji
    
    static var identifierFactory = 0
    static func getUniqueidentifier()->Int
    {
        identifierFactory+=1
        return identifierFactory
    }
    
    init()
    {
        self.identifier = Card.getUniqueidentifier()
    }
}

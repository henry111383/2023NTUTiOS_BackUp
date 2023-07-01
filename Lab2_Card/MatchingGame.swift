//
//  MatchingGame.swift
//  Card
//
//  Created by Jing Han on 2023/3/17.
//

import Foundation
import UIKit
class MatchingGame{
    var cards :Array<Card> = []
//    var indexOfOneAndOnlyFaceUpCard: Int?
    
    var flipcount = 0
    var FlipAll = false
    init(numberOfPairOfCards: Int){
        for _ in 1...numberOfPairOfCards{
            let card = Card()
//            cards += [Card(),Card()]
            cards += [card, card]//pass-by-value
        }
        cards.shuffle()
    }
    
    func chooseCard(at index:Int)->Card{
        if !cards[index].isMatched{
            flipcount += 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }//matched
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }//has another previous card face up
            else if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex == index{
                cards[index].isFaceUp = false
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else{ //no cards face up or 2 cards are face up
//                for flipDownIndex in cards.indices{
//                    if !cards[flipDownIndex].isMatched{
//                        cards[flipDownIndex].isFaceUp = false
//                    }
//                } // all cards set back to face down
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        return cards[index]
    }

    
    // ==== computed property ====
    var indexOfOneAndOnlyFaceUpCard:Int?{
        get{
            let foundIndex = cards.indices.filter { cards[$0].isFaceUp && !cards[$0].isMatched }
            return foundIndex.count == 1 ? foundIndex.first : nil
//            var foundIndex:Int?
//            for index in cards.indices{
//                if !cards[index].isMatched, cards[index].isFaceUp{
//                    if foundIndex == nil{
//                        foundIndex = index
//                    }else{
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set{
            for index in cards.indices{
                if !cards[index].isMatched{
                    cards[index].isFaceUp = (index == newValue)
                }
            }
        }
    }
    // ==========================
    func UpdateFlipCountLabel()->NSAttributedString{
        let flip_label_attributes : [NSAttributedString.Key : Any] = [
            .font : UIFont.systemFont(ofSize: 20),
            .strokeColor : UIColor.darkGray,
            .strokeWidth : -3.0,
            .foregroundColor : UIColor.darkGray]
        let attribtext = NSAttributedString(string: "  Flips :   \(flipcount)", attributes: flip_label_attributes)
        return attribtext
    }
}


//
//  Concentration.swift
//  Concentration
//
//  Created by YinYifei on 2018-02-11.
//  Copyright © 2018 Yifei Yin. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    var IndicesOfCardsFacingUp = [Int]()
    
    init(numberOfPairsOfCards: Int) {
        Card.ResetUniqueIdentifier()
        for _ in 0..<numberOfPairsOfCards {
            let cardtmp = Card(identifier: Card.GetUniqueIdentifier())
            cards += [cardtmp, cardtmp]
        }
        
        // Shuffle cards
        for _ in 0..<numberOfPairsOfCards * 5 {
            let a = Int(arc4random_uniform(UInt32(cards.count))), b = Int(arc4random_uniform(UInt32(cards.count)))
            if a != b {
                let tmp = cards[a].identifier
                cards[a].identifier = cards[b].identifier
                cards[b].identifier = tmp
            }
        }
    }
    
    func ChooseCard(at newIndex: Int) {
        
        switch IndicesOfCardsFacingUp.count {
        case 0:
            cards[newIndex].isFaceUp = true
            IndicesOfCardsFacingUp += [newIndex]
            
        case 1:
            if newIndex == IndicesOfCardsFacingUp[0] {
                cards[newIndex].isFaceUp = false
                IndicesOfCardsFacingUp.removeAll()
            } else {
                cards[newIndex].isFaceUp = true
                IndicesOfCardsFacingUp += [newIndex]
            }
            
        case 2:
            let indexA = IndicesOfCardsFacingUp[0]
            let indexB = IndicesOfCardsFacingUp[1]
            
            if cards[indexA].identifier == cards[indexB].identifier {
                cards[indexA].isHidden = true
                cards[indexB].isHidden = true
            } else {
                cards[indexA].isFaceUp = false
                cards[indexB].isFaceUp = false
            }
            
            IndicesOfCardsFacingUp.removeAll()
            cards[newIndex].isFaceUp = true
            IndicesOfCardsFacingUp += [newIndex]
            
        default:
            print("error: Unexpected IndicesOfCardsFacingUp value")
        }
        
        
//        if let oldIndex = indexOfOneAndOnlyChosenCard {
//            // one card was facing up
//            if newIndex != oldIndex, cards[newIndex].identifier == cards[oldIndex].identifier {
//                    // two cards match
//                    cards[newIndex].isHidden = true
//                    cards[oldIndex].isHidden = true
//                } else {
//                    // two cards does not match
//                    cards[newIndex].isFaceUp = !cards[newIndex].isFaceUp
//            }
//            indexOfOneAndOnlyChosenCard = nil
//
//        } else {
//            // no cards or two cards are face up
//            for index in cards.indices {
//                cards[index].isFaceUp = false
//            }
//            cards[newIndex].isFaceUp = true
//            indexOfOneAndOnlyChosenCard = newIndex
//        }
    }

}

//
//  MemoryGame.swift
//  StanfordMemorize
//
//  Created by Paulo Orquillo on 1/08/21.
//

import Foundation


struct MemoryGame<CardContent> {
    // Act as gatekeeper
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card){
        if let chosenIndex = index(of: card) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil // bogus!
    }
    // generics CardContent is a function
    init(numberOfParisOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfParisOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

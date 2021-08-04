//
//  MemoryGame.swift
//  StanfordMemorize
//
//  Created by Paulo Orquillo on 1/08/21.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    // Act as gatekeeper
    private(set) var cards: Array<Card>
    
    private var indexofTheOneAndOnlyFaceUpCard: Int? {
        get { return cards.indices.filter( { cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            // check for potential match
            if let potentialMatchIndex = indexofTheOneAndOnlyFaceUpCard {
                // chosenIndex and potential match needs to be equatable
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexofTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
        }
    }
    
    // generics CardContent is a function
    init(numberOfParisOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfParisOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}

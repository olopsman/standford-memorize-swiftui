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
    
    private var indexofTheOneAndOnlyFaceUpCard: Int?
    
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
                indexofTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in 0..<cards.count {
                    cards[index].isFaceUp = false
                }
                indexofTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

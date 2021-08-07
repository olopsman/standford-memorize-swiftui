//
//  EmojiMemoryGame.swift
//  StanfordMemorize
//
//  Created by Paulo Orquillo on 1/08/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card

    private static var emojis = ["✈️","🚟","🚀","🎠","⛵️","🛸","🚁","🛶","🚝","🚄","🚅","🚈","🚂","🚆","🚇","🚊","🚗"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfParisOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}

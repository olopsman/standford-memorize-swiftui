//
//  EmojiMemoryGame.swift
//  StanfordMemorize
//
//  Created by Paulo Orquillo on 1/08/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    static var emojis = ["✈️","🚟","🚀","🎠","⛵️","🛸","🚁","🛶","🚝","🚄","🚅","🚈","🚂","🚆","🚇","🚊","🚗"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfParisOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

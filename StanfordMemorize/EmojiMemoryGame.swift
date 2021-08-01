//
//  EmojiMemoryGame.swift
//  StanfordMemorize
//
//  Created by Paulo Orquillo on 1/08/21.
//

import SwiftUI

class EmojiMemoryGame {

    static var emojis = ["✈️","🚟","🚀","🎠","⛵️","🛸","🚁","🛶","🚝","🚄","🚅","🚈","🚂","🚆","🚇","🚊","🚗"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfParisOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}

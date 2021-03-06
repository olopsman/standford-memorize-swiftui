//
//  StanfordMemorizeApp.swift
//  StanfordMemorize
//
//  Created by Paulo Orquillo on 1/08/21.
//

import SwiftUI

@main
struct StanfordMemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}

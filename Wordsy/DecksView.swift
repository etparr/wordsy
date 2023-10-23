//
//  DecksView.swift
//  Wordsy
//
//  Created by Ethan Parr on 10/13/23.
//

import SwiftUI

struct DecksView: View {
    // Define your deck data with title, imageName, and timeLeft
    let decks: [(title: String, imageName: String, timeLeft: Int?)] = [
        ("Countries", "Countries Deck", nil),
        ("Food", "Food Deck", nil),
        // Add more decks as needed
    ]

    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color(red: 0.965, green: 0.957, blue: 0.922)
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 10) {
                        ForEach(decks, id: \.title) { deck in
                            NavigationLink(destination: DeckSettingsView(title: deck.title, imageName: deck.imageName, timeLeft: deck.timeLeft ?? 60)) {
                                DeckView(title: deck.title, imageName: deck.imageName)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Decks")
        }
    }
}

#Preview {
    DecksView()
}




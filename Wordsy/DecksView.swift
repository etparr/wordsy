//
//  DecksView.swift
//  Wordsy
//
//  Created by Ethan Parr on 10/13/23.
//

import SwiftUI

struct DecksView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color(red: 0.965, green: 0.957, blue: 0.922)
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 10) {
                        HStack {
                            DeckView(title: "Countries", imageName: "Countries Deck")
                            DeckView(title: "Food", imageName: "Food Deck")
                        }
                        HStack {
                            DeckView(title: "Deck 3", imageName: "Landmarks Deck")
                            DeckView(title: "Deck 4", imageName: "defaultimage")
                        }
                        HStack {
                            DeckView(title: "Deck 3", imageName: "defaultimage")
                            DeckView(title: "Deck 3", imageName: "defaultimage")
                        }
                        HStack {
                            DeckView(title: "Deck 3", imageName: "defaultimage")
                            DeckView(title: "Deck 3", imageName: "defaultimage")
                        }
                        // Add more DeckView instances as needed
                    }
                }
            }
        }
    }
}
#Preview {
    DecksView()
}



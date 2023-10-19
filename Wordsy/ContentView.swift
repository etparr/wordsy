//
//  ContentView.swift
//  Wordsy
//
//  Created by Ethan Parr on 10/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color(red: 0.965, green: 0.957, blue: 0.922)
                    .edgesIgnoringSafeArea(.all)
                Image(.wordsylogo)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .padding(.bottom, 300)
                VStack(spacing: 15){
                    NavigationLink(destination: DecksView()) {
                        Text("Decks")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(Color(red: 0.275, green: 0.51, blue: 0.663)) // #4682a9
                    }
                    NavigationLink(destination: HowToView()) {
                        Text("How To")
                            .font(.title)
                            .foregroundStyle(Color(red: 0.275, green: 0.51, blue: 0.663)) // #4682a9
                    }
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                            .font(.title)
                            .foregroundStyle(Color(red: 0.275, green: 0.51, blue: 0.663)) // #4682a9
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}

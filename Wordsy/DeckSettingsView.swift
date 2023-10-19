//
//  DeckSettingsView.swift
//  Wordsy
//
//  Created by Ethan Parr on 10/18/23.
//

import Foundation
import SwiftUI

struct DeckSettingsView: View {
    var title: String
    var imageName: String
    @State var timeLeft: Int
    var body: some View {
        NavigationLink(destination: GameView(filename: title, timeLeft: timeLeft)) {
            VStack {
                ZStack {
                    Image(imageName)
                        .resizable()
                        .frame(width:(UIScreen.main.bounds.size.width / 2.15) , height: (UIScreen.main.bounds.size.height / 4.5))
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                    Text(title)
                }
                HStack {
                    Button(action: {
                        timeLeft -= 5
                                }) {
                                    Text("-")
                                        .font(.headline)
                                        .foregroundColor(Color(red: 0.275, green: 0.51, blue: 0.663))
                                        .padding()
                                        .cornerRadius(10)
                                }
                    Text("Timer: " + String(timeLeft))
                    Button(action: {
                        timeLeft += 5
                                }) {
                                    Text("+")
                                        .font(.headline)
                                        .foregroundColor(Color(red: 0.275, green: 0.51, blue: 0.663))
                                        .padding()
                                        .cornerRadius(10)
                                }
                }
            }
        }
    }
}

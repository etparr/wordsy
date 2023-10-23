//
//  DeckView.swift
//  Wordsy
//
//  Created by Ethan Parr on 10/14/23.
//

import Foundation
import SwiftUI

struct DeckView: View {
    var title: String
    var imageName: String
    var timeLeft: Int?

    var body: some View {
        NavigationLink(destination: DeckSettingsView(title: title, imageName: imageName, timeLeft: timeLeft ?? 60)) {
            ZStack {
                Image(imageName)
                    .resizable()
                    .frame(width: (UIScreen.main.bounds.size.width / 2.15), height: (UIScreen.main.bounds.size.height / 4.5))
                    .border(Color.black, width: 2)
            }
        }
    }
}



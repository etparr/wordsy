//
//  GameView.swift
//  Wordsy
//
//  Created by Ethan Parr on 10/13/23.
//

import Foundation
import SwiftUI
import SpriteKit
import SwiftUI

struct GameView: View {
    var filename: String
    var timeLeft: Int
    @State private var shuffledWords: [String] = []
    
    var body: some View {
        SpriteView(scene: GameScene(size: CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), filename: filename, timeLeft: timeLeft))
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            .edgesIgnoringSafeArea(.all)

        }
    }




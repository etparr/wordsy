//
//  GameScene.swift
//  Wordsy
//
//  Created by Ethan Parr on 10/13/23.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    var filename: String
    var wordProcessor = WordProcessor()
    var wordStack: [String] = []
    var introCountdownLabel: SKLabelNode!
    var countdownLabel: SKLabelNode!
    var wordLabel: SKLabelNode!
    var timer: Timer?
    var timer2: Timer?
    var introTime = 5
    var timeLeft: Int
    var finishedStack: [WordEntry] = []
    
    init(size: CGSize, filename: String, timeLeft: Int) {
        self.filename = filename
        self.timeLeft = timeLeft
        super.init(size: size)
        
        
        do {
            self.wordStack = try wordProcessor.processWordsPipeline(filename: filename)
        } catch {
            print("Error processing words: \(error)")
            self.wordStack = []
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        //background color
        self.backgroundColor = SKColor(red: 0.965, green: 0.957, blue: 0.922, alpha: 1.0)
        
        introCountdownLabel = SKLabelNode(fontNamed: "Arial")
        introCountdownLabel.fontSize = 36
        introCountdownLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        introCountdownLabel.color = UIColor(red: 0, green: 0, blue: 1, alpha: 0.2)
        addChild(introCountdownLabel)
        
        wordLabel = SKLabelNode(fontNamed: "Arial")
        wordLabel.fontSize = 48
        wordLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        wordLabel.color = UIColor(red: 0.275, green: 0.51, blue: 0.663, alpha: 0)
        addChild(wordLabel)
        
        countdownLabel = SKLabelNode(fontNamed: "Arial")
        countdownLabel.fontSize = 36
        countdownLabel.position = CGPoint(x: size.width * 0.75, y: size.height * 0.80)
        countdownLabel.color = UIColor(red: 0.275, green: 0.51, blue: 0.663, alpha: 1)
        addChild(countdownLabel)
        startCountdown1()
    }
    
    func startCountdown1() {
        introCountdownLabel.text = "\(introTime)"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown1), userInfo: nil, repeats: true)
    }
    
    @objc func updateCountdown1() {
        introTime -= 1
        introCountdownLabel.text = "\(introTime)"
        
        if introTime <= 0 {
            displayNextWord()
            startCountdown2()
            timer?.invalidate()
            timer = nil
            introCountdownLabel.isHidden = true
        }
    }
    func startCountdown2() {
        countdownLabel.text = "\(timeLeft)"
        timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown2), userInfo: nil, repeats: true)
    }
    
    @objc func updateCountdown2() {
        timeLeft -= 1
        countdownLabel.text = "\(timeLeft)"
        
        if timeLeft <= 0 {
            timer2?.invalidate()
            timer2 = nil
            countdownLabel.isHidden = true
            backgroundColor = UIColor.red
            for entry in finishedStack {
                print("Word: \(entry.word), isCorrect: \(entry.isCorrect)")
            }
        }
    }
    
    struct WordEntry {
        let word: String
        let isCorrect: Bool
    }
    
    var count = 0
    func displayNextWord() {
        if let firstWord = wordStack.first {
            wordLabel.text = firstWord
            finishedStack.append(WordEntry(word: wordStack.removeFirst(), isCorrect: true))
            count += 1
        } else {
            wordLabel.text = "No more words!" // Fallback message when the stack is empty
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        displayNextWord()
    }
}

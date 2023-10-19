//
//  WordProcessor.swift
//  Wordsy
//
//  Created by Ethan Parr on 10/13/23.
//

import Foundation

class WordProcessor {
    var shuffledWordsArray: [String] = []
    
    enum WordProcessorError: Error {
        case fileNotFound
        case fileReadError(Error)
    }
    // File to Array
    func readWordsFromFile(filename: String) throws -> [String] {
        guard let filePath = Bundle.main.path(forResource: filename, ofType: "txt") else {
            throw WordProcessorError.fileNotFound
        }
        do {
            let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)
            let words = fileContent.components(separatedBy: .newlines)
            return words
        } catch {
            throw WordProcessorError.fileReadError(error)
        }
    }

    func randomizeWords(wordArray: [String]) -> [String] {
        shuffledWordsArray = wordArray.shuffled()
        return shuffledWordsArray
    }
    
    func processWordsPipeline(filename: String) throws -> [String] {
        
        return try randomizeWords(wordArray: readWordsFromFile(filename: filename))
    }
}

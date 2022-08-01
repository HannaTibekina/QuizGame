//
//  Quiz.swift
//  QuizGame
//
//  Created by Анна Тибекина on 01.08.2022.
//

import Foundation

struct Quiz: Decodable {
    var results: [Result]
    
    
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String ]
        
        var formatedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch {
                print("Error settings formatedQuestion: \(error)")
                return ""
            }
        }
        var answers: [Answer] {
            do {
                let corretc = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrect = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                let allAnswers = corretc + incorrect
                return allAnswers.shuffled()
                
            } catch {
                print("Error settings answers: \(error)")
                return []
            }
        }
        
    }
}

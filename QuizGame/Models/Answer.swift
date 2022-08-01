//
//  Answer.swift
//  QuizGame
//
//  Created by Анна Тибекина on 01.08.2022.
//


import Foundation


struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}

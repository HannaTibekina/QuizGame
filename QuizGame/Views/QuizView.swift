//
//  QuizView.swift
//  QuizGame
//
//  Created by Анна Тибекина on 01.08.2022.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var quizManager: QuisManager
    var body: some View {
        if quizManager.reachEnd {
            VStack(spacing: 20) {
               Text("Game Quiz")
                    .lilacTitle()
                
                Text("Congratilations, you completed the game! 🥳")
                
                Text("You scored \(quizManager.score) out of \(quizManager.lenght)")
                
                Button {
                    Task.init {
                        await quizManager.fetchQuiz()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
                
                
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.932, green: 0.882, blue: 0.687))
        } else {
            QuestionView()
                .environmentObject(quizManager)
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(QuisManager())
    }
}


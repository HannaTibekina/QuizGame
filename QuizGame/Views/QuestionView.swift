//
//  QuestionView.swift
//  QuizGame
//
//  Created by Анна Тибекина on 01.08.2022.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizManager: QuisManager
    var body: some View {
        VStack(spacing: 40) {
            HStack{
                Text("Game Quis")
                    .lilacTitle()
                
                Spacer()
                
                Text("\(quizManager.index + 1) out of \(quizManager.lenght)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: quizManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(quizManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                ForEach(quizManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(quizManager)
                }
                
            }
            Button {
                quizManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: quizManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!quizManager.answerSelected)
            
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.932, green: 0.882, blue: 0.687))
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuisManager())
    }
}

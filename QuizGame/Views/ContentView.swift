//
//  ContentView.swift
//  QuizGame
//
//  Created by Анна Тибекина on 01.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var quizManager = QuisManager()
    
    var body: some View{
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Game Quiz")
                        .lilacTitle()
                    
                    Text("Are you reade to test your skills?")
                        .foregroundColor(Color("AccentColor"))
                }
                
                NavigationLink {
                    QuizView()
                        .environmentObject(quizManager)
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
                
               
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.932, green: 0.882, blue: 0.687))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

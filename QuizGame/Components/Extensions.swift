//
//  Extensions.swift
//  QuizGame
//
//  Created by Анна Тибекина on 01.08.2022.
//


import Foundation
import SwiftUI

extension Text {
    func lilacTitle() -> some View{
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}

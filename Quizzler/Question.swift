//
//  Question.swift
//  Quizzler
//
//  Created by Vamsi Kaza on 20/06/17.
//  Copyright © 2017 Sem1Colon Inc. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}

//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Supanut Laddayam on 31/3/2563 BE.
//  Copyright © 2563 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a:[String], correctAnswer:String) {
        self.text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}

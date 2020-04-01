//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerChoiceOneButton: UIButton!
    @IBOutlet weak var answerChoiceTwoButton: UIButton!
    @IBOutlet weak var answerChoiceThreeButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    
    @IBAction func answerButtonPress(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!// True, false
        let responseAnswer = quizBrain.checkAnswer(userAnswer)
        
        if responseAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
//            self.updateUI()
//        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        //question Label
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        //button Label
        answerChoiceOneButton.setTitle(quizBrain.getAnswerChoiceOne(), for: .normal)
        answerChoiceTwoButton.setTitle(quizBrain.getAnswerChoiceTwo(), for: .normal)
        answerChoiceThreeButton.setTitle(quizBrain.getAnswerChoiceThree(), for: .normal)
        
        //reset background button color
        answerChoiceOneButton.backgroundColor = UIColor.clear
        answerChoiceTwoButton.backgroundColor = UIColor.clear
        answerChoiceThreeButton.backgroundColor = UIColor.clear
        
        //progressPercentage
        progressBar.progress = quizBrain.getProgress()

        
        
    }
    
    
}


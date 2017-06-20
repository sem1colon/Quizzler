//
//  ViewController.swift
//  Quizzler
//
//  Created by Vamsi Kaza on 20/06/2017.
//  Copyright (c) 2017 Sem1Colon Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber = questionNumber + 1
  
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
    }
    

    func nextQuestion() {
        
        
        if questionNumber <= 12{
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else{
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to startover?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct!")
            score = score + 100
        }
        else{
            ProgressHUD.showError("Wrong!")
            score = score - 50
        }
        
    }
    
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
    }
    

    
}

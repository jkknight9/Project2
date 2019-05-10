//
//  ViewController.swift
//  Project2
//
//  Created by Jack Knight on 5/2/19.
//  Copyright © 2019 Jack Knight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UIBarButtonItem!
    
    var countries = [String]()
    var score = 0
    var questionCount = 0
    var correctAnswer = 0
    var wrongAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
        button1.layer.borderWidth = 0.5
        button2.layer.borderWidth = 0.5
        button3.layer.borderWidth = 0.5
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        wrongAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title = String()
        if questionCount <= 10 {
            if sender.tag == correctAnswer {
               
                title = "Correct"
                let ac = UIAlertController(title: title , message: "That's the \(countries[correctAnswer].uppercased()) flag", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
                score += 1
                scoreLabel.title = "Score: \(score)"
                
            } else if sender.tag == wrongAnswer {
              
                title = "Wrong"
                let ac = UIAlertController(title: title , message: "That's the \(countries[wrongAnswer].uppercased()) flag", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
                score -= 1
                scoreLabel.title = " Score: \(score)"
            }
            questionCount = questionCount + 1
            
        } else {
            let ac = UIAlertController(title: "Final Score is \(score)", message: "You finished all the questions, would you like to start over?", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Start Over", style: .default, handler: { (action) in
                self.startOver()
            }))
            present(ac, animated:  true)
        }
    }
    
    func startOver() {
        score = 0
        questionCount = 0
        scoreLabel.title = "Score: \(score)"
        countries.shuffle()
    }
}


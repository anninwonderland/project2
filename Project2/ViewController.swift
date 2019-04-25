//
//  ViewController.swift
//  Project2
//
//  Created by Ann on 25/04/2019.
//  Copyright © 2019 Ann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var tappedScreens = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += [ "estonia", "france", "germany", "ireland", "italy", "monaco",
                        "nigeria", "poland", "russia", "spain", "uk", "us"]             //mix the array's item order and pick 3 first of them
        
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.lightGray.cgColor
        
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion() //askQuestion(action: nil)
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle() //mixed
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + "   Score is \(score)"
    }
    
    func startAgain(action: UIAlertAction! = nil) {
        score = 0
        askQuestion()
    }
    
    func showAlert() {
        let ac = UIAlertController(title: "Congratulations!", message: "You've answered 10 questions",
                                   preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Wow",
                                   style: .default, handler: startAgain))
        
        present(ac, animated: true)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) { //connected to all three buttons on the screen
        var title = ""
        var mess = ""
        tappedScreens += 1
        
        if tappedScreens == 10 {
            showAlert()
        }
        
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
        } else {
            title = "Oops!"
            mess = "The correct answer is \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: mess + "\n Your score is \(score). Nice!",
            preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue",
            style: .default, handler: askQuestion))
        
        present(ac, animated: true) //presentation of the alert view
    
}
}


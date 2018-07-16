//
//  ViewController.swift
//  Project2
//
//  Created by Alexander Clark on 7/16/18.
//  Copyright © 2018 Alexander Clark. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        button1.layer.borderWidth = 3
        button2.layer.borderWidth = 3
        button3.layer.borderWidth = 3
        
        button1.layer.borderColor = UIColor.black.cgColor
        button2.layer.borderColor = UIColor.black.cgColor
        button3.layer.borderColor = UIColor.black.cgColor
        
        askQuestion(action: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func askQuestion(action: UIAlertAction!){
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 2)
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if sender.tag == correctAnswer {
            title = "Correct! Awesome job!"
            score += 1
        }
        
        else{
            title = "Try Again!"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title:"Continue",style: .default, handler: askQuestion))
        present(ac,animated:true)
    }
    
 
    
    
}


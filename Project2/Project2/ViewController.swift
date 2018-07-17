//
//  ViewController.swift
//  Project2
//
//  Created by Alexander Clark on 7/16/18.
//  Copyright © 2018 Alexander Clark. All rights reserved.
//

import UIKit
//Importing for Random Answers (Shuffling of Countries Array)
import GameplayKit

class ViewController: UIViewController {

    //Defining 3 Flag Buttons
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    //Creating Empty Array for countries
    var countries = [String]()
    //Creating a Int to store the correct Answer (0, 1, 2)
    var correctAnswer = 0
    //Creating int to hold score
    var score = 0
    
    
    override func viewDidLoad() {
        //Letting iOS handle its work first
        super.viewDidLoad()
        
        //Appending Countries to countires Array (Terrible formatting could be done on 1 line)
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
        
        //Adding Borders to Buttons for better flag visability
        button1.layer.borderWidth = 3
        button2.layer.borderWidth = 3
        button3.layer.borderWidth = 3
        
        //Changing border color
        button1.layer.borderColor = UIColor.black.cgColor
        button2.layer.borderColor = UIColor.black.cgColor
        button3.layer.borderColor = UIColor.black.cgColor
        
        askQuestion(action: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    //This function throws a new question on the screen and asks which flag matches the Title of the view!
    func askQuestion(action: UIAlertAction!){
        //Shuffling the array using Game Kit!
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        //Setting flag images to first 3 images of the array
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        //Pulling random correct answer from first 3 spots in the array
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 2)
        //Setting title of view to the name of the random country chosen by Game kit
        title = countries[correctAnswer].uppercased()
    }

    //This function happens whenever a flag is tapped
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        //If the user picked the correct answer set title and increment score
        if sender.tag == correctAnswer {
            title = "Correct! Awesome job!"
            score += 1
        }
        
        //If user is incorrect set bad title and decrement message
        else{
            title = "Nice Try!"
            score -= 1
        }
        
        //Setting  up alert popup to output Title based off correct/incorrect answer and displaying score
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title:"Continue",style: .default, handler: askQuestion))
        present(ac,animated:true)
    }
    
 
    
    
}


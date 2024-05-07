//
//  CharadesViewController.swift
//  CharadesApp
//
//  Created by Charity Funtila on 5/6/24.
//

import UIKit

class CharadesViewController: UIViewController {

    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    let words = ["Frog", "Bird", "Dog", "Cat", "Snake", "Bunny", "Lion", "Monkey", "Unicorn", "Shark"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animalLabel.text = words[0]

        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }
    
    @objc func runTimer() {
       print("a second later")
    }


}


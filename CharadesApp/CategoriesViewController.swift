//
//  CategoriesViewController.swift
//  CharadesApp
//
//  Created by Charity Funtila on 5/20/24.
//

import UIKit

class CategoriesViewController: UIViewController {
    let animals = ["Frog", "Bird", "Dog", "Cat", "Snake", "Bunny", "Lion", "Monkey", "Unicorn", "Shark"]
    let sports = ["Golf", "Tennis", "Basketball", "Baseball", "Swimming"]
    let occupations = ["Doctor", "Software Engineer", "Dentist", "Chef", "CEO"]
    let movies = ["Sleeping Beauty", "The Notebook", "Barbie", "Home Alone", "Inside Out"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func categoryPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
        var words: [String] = []
        if sender.currentTitle! == "Animals" {
            words = animals
        }
        if sender.currentTitle! == "Sports" {
            words = sports
        }
        if sender.currentTitle! == "Occupations" {
            words = occupations
        }
        if sender.currentTitle! == "Movies" {
            words = movies
        }
        
        let charadesVC = CharadesViewController(words: words)
        present(charadesVC, animated: true)
        
    }
    
}

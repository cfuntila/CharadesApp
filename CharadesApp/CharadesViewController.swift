//
//  CharadesViewController.swift
//  CharadesApp
//
//  Created by Charity Funtila on 5/6/24.
//

import UIKit
import CoreMotion

class CharadesViewController: UIViewController {

    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    let motionManager = CMMotionManager()
    
    var words: [String] = []
    var wordIndex = 0
    var isDebouncing = false
    
    init(words: [String]) {
        super.init(nibName: nil, bundle: nil)
        self.words = words
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNextWord()
        
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { data, error in
            if data != nil {
                self.handleTilt(data!)
            }
        }
    }
    
    func handleTilt(_ data: CMAccelerometerData) {
        if isDebouncing == true {
            return
        }
        
        let acceleration = data.acceleration
        let currentPosition = acceleration.z
        
        let upTilt = -0.8
        let downTilt = 0.8
        
        if currentPosition < upTilt {
//            tilted upward, skip
            print("Skip")
            waitForBounceBack()
            showNextWord()
        }
        if currentPosition > downTilt {
            print("Pass")
            waitForBounceBack()
            showNextWord()
        }
        
    }
    
    func showNextWord() {
        if wordIndex >= words.count {
            return
        } else {
            animalLabel.text = words[wordIndex]
            wordIndex += 1
        }
        
    }
    
    func waitForBounceBack() {
        isDebouncing = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isDebouncing = false
        }
    }
    
    func triggerDebounce() {
               // Set debouncing state
               isDebouncing = true
               
               // Wait for 1 second before allowing another action
               DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                   self.isDebouncing = false
               }
           }
}


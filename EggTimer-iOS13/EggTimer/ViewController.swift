//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var eggLabel: UILabel!
    @IBOutlet weak var eggProgress: UIProgressView!
    var player: AVAudioPlayer?
    
    let eggTimes = ["Soft":5, "Medium":8, "Hard":12]
    var chosenTime = 60
    var secondsPassed = 0
    
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
//        let hardness = sender.currentTitleijn
        timer.invalidate()
        eggProgress.progress = 0.0
        secondsPassed = 0
        
        let mins = eggTimes[sender.currentTitle!]!
        chosenTime = 1*mins
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < chosenTime {
            eggLabel.text = "\(chosenTime - secondsPassed) seconds left"
            secondsPassed += 1
            eggProgress.progress = Float(secondsPassed)/Float(chosenTime)
        } else if secondsPassed == chosenTime {
            playSound()
            timer.invalidate()
            eggLabel.text = "Done!"
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

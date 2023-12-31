//
//  ViewController.swift
//  Marathon 8.0 Egg Timer
//
//  Created by Ислам Пулатов on 7/26/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    var totalTime = 0
    
    var secondsPassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        timer.invalidate()
        
        guard let hardness = sender.currentTitle else { return }
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        
        secondsPassed = 0
        
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        
    }
    
    
    @objc func updateTimer() {
        
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            print(Float(secondsPassed) / Float(totalTime))
            
        } else {
        
            timer.invalidate()
            
            titleLabel.text = "DONE!"
            
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            
            player = try! AVAudioPlayer(contentsOf: url!)
            
            player.play()
        }
        
    }
}


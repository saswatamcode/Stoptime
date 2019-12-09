//
//  ViewController.swift
//  StopTime
//
//  Created by Saswata Mukherjee on 09/12/19.
//  Copyright © 2019 Saswata Mukherjee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var counter = 0.0
    var min = 0
    var hr = 0
    var timer = Timer()
    var isPlaying = false
    
    @IBAction func startTimer(_ sender: Any) {
        
        if (isPlaying)
        {
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    
    @IBAction func pauseTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isPlaying = false
        
    }
    
    
    @IBAction func resetTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        min = 0
        timeLabel.text = String(counter)
    }
    
    @objc func updateTimer()
    {
        counter = counter + 0.1
        if counter >= 60{
            counter = 0.0
            min = min + 1
        }
        if min>=60{
            min = 0
            hr = hr+1
        }
        
        if min == 0 && hr==0{
            timeLabel.text = String(format: "%.1f", counter)
        }
        else if hr==0{
            timeLabel.text = String(format: "%d : %.1f",min,counter)
        }
        else{
            timeLabel.text = String(format: "%d : %d : %.1f",hr,min,counter)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timeLabel.text = String(counter)
        pauseButton.isEnabled = false
    }


}


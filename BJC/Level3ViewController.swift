//
//  Level3ViewController.swift
//  BJC
//
//  Created by MacBookPro on 6/14/19.
//  Copyright © 2019 MacBookPro. All rights reserved.
//

import UIKit

class Level3ViewController: UIViewController {
    
    var countdownTimer: Timer!
    var totalTime = 60
    var timeIsRunning = false
    @IBOutlet weak var timerLabel: UILabel!
    @IBAction func startCounterButtonPressed(_ sender: UIButton) {
        changeImage1()
        changeImage2()
        if timeIsRunning == false {
           startTimer()
        }else{
            print("start button pressed more than one time")
        }
    }
    
    @objc func updateTime() {
    timerLabel.text = "\(timeFormatted(totalTime))"
    
    if totalTime != 0 {
        totalTime -= 1
    }
    else {
        endTimer()
        timerLabel.text = "Time Out"
        print("Time Out")
        
   }    
  }
    func endTimer() {
        countdownTimer.invalidate()
    }
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    func startTimer(){
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        timeIsRunning = true
        print("time start running")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image4.isHidden = true
        image5.isHidden = true
    
    }
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    
    @objc func showImage1() {
        image1.isHidden = true
    }
    func changeImage1(){
        if !image1.isHidden {
            image1.isHidden = false
            Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(showImage1), userInfo: nil, repeats: false)
            image4.isHidden = false
        }
    }
    @objc func showImage2() {
        image2.isHidden = true
    }
    func changeImage2(){
        if !image2.isHidden {
            image2.isHidden = false
            Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(showImage2), userInfo: nil, repeats: false)
            image5.isHidden = false
        }
    }
    @objc func showImage3() {
        image3.isHidden = true
    }
    func changeImage3(){
        if !image3.isHidden {
            image3.isHidden = false
            Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(showImage3), userInfo: nil, repeats: false)
        }
    }
    
}

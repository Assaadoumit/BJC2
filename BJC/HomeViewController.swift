//
//  HomeViewController.swift
//  BJC
//
//  Created by MacBookPro on 12/18/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    @IBOutlet weak var GiveATryButton: UIButton!
    @IBOutlet weak var HowToCountButton: UIButton!
    @IBOutlet weak var HighScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HighScoreLabel.text = "0"
        GiveATryButton.layer.cornerRadius = 20
        HowToCountButton.layer.cornerRadius = 20
        if (ViewController.shared.highScoreDefault.value(forKey: "highScore") != nil){
            ViewController.shared.highScore = ViewController.shared.highScoreDefault.value(forKey:
                "highScore") as! Int
        }
        
        HighScoreLabel.text = " HighScore = \(ViewController.shared.highScore)"
        
        
        
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
        }
        
        
    }
}



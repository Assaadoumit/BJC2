//
//  LevelsViewController.swift
//  BJC
//
//  Created by MacBookPro on 12/17/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

    

import UIKit
import SVProgressHUD


class LevelsViewController: UIViewController {

    @IBOutlet weak var HowLevel2: UIButton!
    @IBOutlet weak var HowLevel1: UIButton!
    @IBOutlet weak var Level2Pressed: UIButton!
    @IBOutlet weak var Level1Pressed: UIButton!

    @IBAction func Level1Instruct(_ sender: Any) {
        SVProgressHUD.showInfo(withStatus: "Count = 0 after each round learn to count 4 cards at a time")
    }
    
    
    @IBAction func Level2Instruct(_ sender: Any) {
        
    SVProgressHUD.showInfo(withStatus: "Count keep running from round to round")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Level1Pressed.layer.cornerRadius = 30
        Level2Pressed.layer.cornerRadius = 30
        
        
         super.didReceiveMemoryWarning()
        func didReceiveMemoryWarning() {
        
        
    }
   
  }
}

//
//  InfoViewController.swift
//  BJC
//
//  Created by MacBookPro on 12/19/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var StartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func backButton(_ sender:UIButton){
        let _ = self.navigationController?.popViewController(animated: true)
    }
     
    @IBAction func startButtonPressed(_ sender:UIButton){
        let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "LevelsViewController")) as! LevelsViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

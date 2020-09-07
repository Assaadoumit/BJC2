//
//  LiveCountingViewController.swift
//  BJC
//
//  Created by MacBookPro on 7/19/19.
//  Copyright © 2019 MacBookPro. All rights reserved.
//

import UIKit

class LiveCountingViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    var count : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(count)
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
        
    }

    
    @IBAction func twoButtonPressed(_ sender: Any) {
        count = count+1
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    @IBAction func threeButtonPressed(_ sender: Any) {
        count = count+1
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    @IBAction func fourButtonPressed(_ sender: Any) {
        count = count+1
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    @IBAction func fiveButtonPressed(_ sender: Any) {
        count = count+1
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    @IBAction func sixButtonPressed(_ sender: Any) {
        count = count+1
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    @IBAction func sevenButtonPressed(_ sender: Any) {
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    @IBAction func eightButtonPressed(_ sender: Any) {
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    @IBAction func nineButtonPressed(_ sender: Any) {
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    @IBAction func tenButtonPressed(_ sender: Any) {
        count = count-1
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    @IBAction func jackButtonPressed(_ sender: Any) {
        count = count-1
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    @IBAction func queenButtonPressed(_ sender: Any) {
        count = count-1
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    @IBAction func kingButtonPressed(_ sender: Any) {
        count = count-1
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    @IBAction func aceButtonPressed(_ sender: Any) {
        count = count-1
        countLabel.text = "The count is \(count)"
        updateAdviceLabel()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)

    }
    
    func updateAdviceLabel(){
        if (count > 10){
            
            adviceLabel.text = "There is a higher chance to get a high card"
        }else if (count < -10){
            
            adviceLabel.text = "There is a higher chance to get a low card"
        }else {
            adviceLabel.text = "" 
        }
    }
}

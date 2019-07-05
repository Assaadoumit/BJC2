//
//  Level2ViewController.swift
//  BJC
//
//  Created by MacBookPro on 12/18/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import UIKit
import SVProgressHUD

public class Level2ViewController: UIViewController , UITextFieldDelegate {
    
    
    @IBOutlet weak var Card1: UIImageView!
    @IBOutlet weak var Card2: UIImageView!
    @IBOutlet weak var Card3: UIImageView!
    @IBOutlet weak var Card4: UIImageView!
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var NextRound: UIButton!
    @IBOutlet weak var  Reset: UIButton!
    public   var randomCardIndex1 : Int = 0
    var randomCardIndex2 : Int = 0
    var randomCardIndex3 : Int = 0
    var randomCardIndex4 : Int = 0
    var score : Int = 0
    
//    var currentScore : Int = 0
    
    
    let Deck = [ "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "Jack", "Queen", "King", "Ace"]
    
    
    override public func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.endEditing(true)
        
        NextRound.layer.cornerRadius = 15
        Reset.layer.cornerRadius = 15
        NextButtonPressed(self)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(sender:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(sender:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)

        self.TextField.delegate = self
        self.TextField.returnKeyType = .done

        
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.TextField.resignFirstResponder()
        NextButtonPressed(self)        
        return true
        
    }
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
        
    }
    
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }

    @IBAction func ResetButtonPressed(_ sender: Any) {
        
      
        randomCardIndex1 = Int(arc4random_uniform(13))
        randomCardIndex2 = Int(arc4random_uniform(13))
        randomCardIndex3 = Int(arc4random_uniform(13))
        randomCardIndex4 = Int(arc4random_uniform(13))
        
        Card1.image = UIImage(named: Deck[randomCardIndex1])
        Card2.image = UIImage(named: Deck[randomCardIndex2])
        Card3.image = UIImage(named: Deck[randomCardIndex3])
        Card4.image = UIImage(named: Deck[randomCardIndex4])
        
        if randomCardIndex1 >= 0 && randomCardIndex1 < 5{
            score = score + 1
            
        }else if randomCardIndex1 > 7 && randomCardIndex1 < 13{
            score = score - 1
            
        }else {
            score = score + 0
        }
        if randomCardIndex2 >= 0 && randomCardIndex2 < 5{
            score = score + 1
            
        }else if randomCardIndex2 > 7 && randomCardIndex2 < 13{
            score = score - 1
            
        }else {
            score = score + 0
        }
        if randomCardIndex3 >= 0 && randomCardIndex3 < 5{
            score = score + 1
            
        }else if randomCardIndex3 > 7 && randomCardIndex3 < 13{
            score = score - 1
            
        }else {
            score = score + 0
        }
        if randomCardIndex4 >= 0 && randomCardIndex4 < 5{
            score = score + 1
            
        }else if randomCardIndex4 > 7 && randomCardIndex4 < 13{
            score = score - 1
            
        }else {
            score = score + 0
        }
        
      
        TextField.text = ""
        score = 0
        
        
    }
    
    @IBAction func HintPressed(_ sender: Any) {
        
        SVProgressHUD.showInfo(withStatus: "2->6:+1  7->9:0  10->Ace:-1")
        
    }
    
    @IBAction func NextButtonPressed(_ sender: Any) {
        CheckAnswer(self)
        
        randomCardIndex1 = Int(arc4random_uniform(13))
        randomCardIndex2 = Int(arc4random_uniform(13))
        randomCardIndex3 = Int(arc4random_uniform(13))
        randomCardIndex4 = Int(arc4random_uniform(13))
        
        Card1.image = UIImage(named: Deck[randomCardIndex1])
        Card2.image = UIImage(named: Deck[randomCardIndex2])
        Card3.image = UIImage(named: Deck[randomCardIndex3])
        Card4.image = UIImage(named: Deck[randomCardIndex4])
        
        if randomCardIndex1 >= 0 && randomCardIndex1 < 5{
            score = score + 1
            
        }else if randomCardIndex1 > 7 && randomCardIndex1 < 13{
            score = score - 1
            
        }else {
            score = score + 0
        }
        if randomCardIndex2 >= 0 && randomCardIndex2 < 5{
            score = score + 1
            
        }else if randomCardIndex2 > 7 && randomCardIndex2 < 13{
            score = score - 1
            
        }else {
            score = score + 0
        }
        if randomCardIndex3 >= 0 && randomCardIndex3 < 5{
            score = score + 1
            
        }else if randomCardIndex3 > 7 && randomCardIndex3 < 13{
            score = score - 1
            
        }else {
            score = score + 0
        }
        if randomCardIndex4 >= 0 && randomCardIndex4 < 5{
            score = score + 1
            
        }else if randomCardIndex4 > 7 && randomCardIndex4 < 13{
            score = score - 1
            
        }else {
            score = score + 0
        }
      
        print("the score is \(score)")
        
        
    }
    @IBAction func count(_ sender: Any){
        SVProgressHUD.showInfo(withStatus: "the count is \(score)")

    }
    
    @IBAction func CheckAnswer(_ sender: AnyObject) {
        
        if TextField.text! == ""{
            SVProgressHUD.showInfo(withStatus: "Please enter the count")
        }
            
        else if  TextField.text! == "\(score)" {
            print("Correct!")
            print(TextField.text as Any)
            SVProgressHUD.showSuccess(withStatus: "Correct!")
            score = 0
        }else  {
            print("incorrecet")
            print(TextField.text as Any)
            SVProgressHUD.showError(withStatus: "Incorrect")
        }
        
        TextField.text = ""
    
        }
    
    }


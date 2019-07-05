//
//  ViewController.swift
//  BJC
//
//  Created by MacBookPro on 12/10/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
// APP Id in ADMob :ca-app-pub-9955020715877598~9830323953
// ad unit id : ca-app-pub-9955020715877598/3143199825


import UIKit
import SVProgressHUD
import CoreData

class ViewController: UIViewController , UITextFieldDelegate {

    
    @IBOutlet weak var NumberOfCardCounted: UILabel!
    @IBOutlet weak var ValidateButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    @IBOutlet weak var DealerCard1: UIImageView!
    @IBOutlet weak var DealerCard2: UIImageView!
    @IBOutlet weak var UserCard1: UIImageView!
    @IBOutlet weak var USerCard2: UIImageView!
    @IBOutlet weak var TextField: UITextField!
    var randomCardIndex1 : Int = 0
    var randomCardIndex2 : Int = 0
    var randomCardIndex3 : Int = 0
    var randomCardIndex4 : Int = 0
    var score :Int = 0
    var achievement : Int = 0
    var highScore : Int = 0
    var firstHighscore : Int = 0
    var highScoreDefault = UserDefaults.standard
    static var shared = ViewController()
    let Deck = [ "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "Jack", "Queen", "King", "Ace"]
    
    
    @IBAction func HintButton(_ sender: Any) {
        SVProgressHUD.showInfo(withStatus: "2->6:+1  7->9:0  10->Ace:-1")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NumberOfCardCounted.text = "\(highScore) cards "
        self.view.endEditing(true)
        let highScoreDefault = UserDefaults.standard
        if (highScoreDefault.value(forKey: "highScore") != nil){
            ViewController.shared.highScore = highScoreDefault.value(forKey: "highScore") as! Int
        }
        
    ResetButton.layer.cornerRadius = 15
//    NextButton.layer.cornerRadius = 15
    ValidateButton.layer.cornerRadius = 15
       
        NextButtonPressed(self)
            NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(sender:)),
                                                name:NSNotification.Name.UIKeyboardWillShow,
                                                object: nil)
        
            NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(sender:)),
                                                name:NSNotification.Name.UIKeyboardWillHide,
                                                object: nil)
        
        // replace return button with done
            self.TextField.delegate = self
            self.TextField.returnKeyType = .done
        
//        NextButtonPressed(self)
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
  

    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 185 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    func NextButtonPressed(_ sender: Any) {
                randomCardIndex1 = Int(arc4random_uniform(13))
                randomCardIndex2 = Int(arc4random_uniform(13))
                randomCardIndex3 = Int(arc4random_uniform(13))
                randomCardIndex4 = Int(arc4random_uniform(13))
                UserCard1.image = UIImage(named: Deck[randomCardIndex3])
                USerCard2.image = UIImage(named: Deck[randomCardIndex4])
                DealerCard1.image = UIImage(named: Deck[randomCardIndex1])
                DealerCard2.image = UIImage(named: Deck[randomCardIndex2])
        
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
      
        print(score)
        
    }
    @IBAction func checkAnswer(_ sender: AnyObject) {
        
        if TextField.text! == ""{
            SVProgressHUD.showInfo(withStatus: "Please enter the count")
        }
          else  if  TextField.text! == "\(score)" {
                print("Correct!")
                SVProgressHUD.showSuccess(withStatus: "Correct! keep the count running")
                achievement = achievement + 1
            
                NextButtonPressed(self)
                print("achivement is ",achievement)
            print("the highscore is",ViewController.shared.highScore)
            if achievement>ViewController.shared.highScore {
                
                ViewController.shared.highScore = achievement
                ViewController.shared.highScoreDefault.setValue(ViewController.shared.highScore, forKey: "highScore")
                ViewController.shared.highScoreDefault.synchronize()
                NumberOfCardCounted.text = "\(achievement) cards "
            }
            
            }else {
                
                print("incorrecet")
                SVProgressHUD.showError(withStatus: "you lost count")
                achievement = 0
   
            }
      
        if achievement == 5{
            SVProgressHUD.showSuccess(withStatus: "Congrats , you just counted 20 cards in a row ")
         

        }else if achievement == 15{
            SVProgressHUD.showSuccess(withStatus: "Congrats , you just counted 60 cards in a row")
            

        }else if achievement == 25{
            SVProgressHUD.showSuccess(withStatus: "Congrats , you just counted 100 cards in a row")
            
        }
            TextField.text = ""
            }

    @IBAction func Reset(_ sender: Any) {
        score = 0
        TextField.text = ""
        achievement = 0

    }

    
    
}

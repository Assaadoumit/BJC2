//
//  HomeViewController.swift
//  BJC
//
//  Created by MacBookPro on 12/18/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//// ad unit id : ca-app-pub-9955020715877598/3143199825
// testing ad unit id ca-app-pub-3940256099942544/6300978111

import UIKit
import CoreData
import GoogleMobileAds


class HomeViewController: UIViewController {
    
    @IBOutlet weak var GiveATryButton: UIButton!
    @IBOutlet weak var HowToCountButton: UIButton!
    @IBOutlet weak var HighScoreLabel: UILabel!
    @IBOutlet weak var bannerView: GADBannerView!
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        HighScoreLabel.text = "0"
        GiveATryButton.layer.cornerRadius = 20
        HowToCountButton.layer.cornerRadius = 20
        if (ViewController.shared.highScoreDefault.value(forKey: "highScore") != nil){
            ViewController.shared.highScore = ViewController.shared.highScoreDefault.value(forKey:
                                                                                            "highScore") as! Int
        }
        
        bannerView.adUnitID = "ca-app-pub-9955020715877598/3143199825"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        HighScoreLabel.text = " HighScore = \(ViewController.shared.highScore) rounds "
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
//    @IBAction func startButtonPressed(_ sender: Any){
//        let vc = LevelsViewController()
//        self.present(vc, animated: true, completion: nil)
//
//    }
//    @IBAction func howToCountButtonPressed(_ sender: Any){
//        let vc = InfoViewController()
//        self.present(vc, animated: true, completion: nil)
//    }
    @IBAction func startButtonPressed(_ sender: Any) {
        let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "LevelsViewController")) as! LevelsViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    @IBAction func howToCountButtonPressed(_ sender: Any) {
        let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "InfoViewController")) as! InfoViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)

        
    }
    //
}

extension HomeViewController: GADBannerViewDelegate{
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("received ad")
    }
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
        print("error in receiving ad")
    }
}

//
//  HomeViewController.swift
//  BJC
//
//  Created by MacBookPro on 12/18/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//// ad unit id : ca-app-pub-9955020715877598/3143199825

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
        HighScoreLabel.text = "0"
        GiveATryButton.layer.cornerRadius = 20
        HowToCountButton.layer.cornerRadius = 20
        if (ViewController.shared.highScoreDefault.value(forKey: "highScore") != nil){
            ViewController.shared.highScore = ViewController.shared.highScoreDefault.value(forKey:
                "highScore") as! Int
            
            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            bannerView.delegate = self
        }
        
        HighScoreLabel.text = " HighScore = \(ViewController.shared.highScore) rounds "
        
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
        }
        
        
    }
}

extension HomeViewController: GADBannerViewDelegate{
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("received ad")
    }
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
        
    }
}

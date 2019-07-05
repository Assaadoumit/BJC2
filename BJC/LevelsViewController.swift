//
//  LevelsViewController.swift
//  BJC
//
//  Created by MacBookPro on 12/17/18.
//  Copyright © 2018 MacBookPro. All rights reserved.

    // ad id ca-app-pub-9955020715877598/8898923532

import UIKit
import SVProgressHUD
import GoogleMobileAds

class LevelsViewController: UIViewController {

    @IBOutlet weak var HowLevel2: UIButton!
    @IBOutlet weak var HowLevel1: UIButton!
    @IBOutlet weak var Level2Pressed: UIButton!
    @IBOutlet weak var Level1Pressed: UIButton!

    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBAction func Back(_ sender: Any) {
        
        
    }
    
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
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
   
  }
}
extension LevelsViewController: GADBannerViewDelegate{
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("received ad")
    }
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
        print("ad not received")
        
    }
}

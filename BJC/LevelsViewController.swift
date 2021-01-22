//
//  LevelsViewController.swift
//  BJC
//
//  Created by Assaad Doumit on 12/17/18.
//  Copyright © 2018 Assaad Doumit. All rights reserved.

// ad id ca-app-pub-9955020715877598/8898923532

import UIKit
import SVProgressHUD
import GoogleMobileAds

class LevelsViewController: UIViewController , GADInterstitialDelegate {
    
    @IBOutlet weak var liveCounting: UIButton!
    @IBOutlet weak var Level2Pressed: UIButton!
    @IBOutlet weak var Level1Pressed: UIButton!
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Level1Pressed.layer.cornerRadius = 30
        Level2Pressed.layer.cornerRadius = 30
        liveCounting.layer.cornerRadius = 30
        
        bannerView.adUnitID = "ca-app-pub-9955020715877598/8898923532"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self

    }
    @IBAction func liveCounting(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toLiveCounting", sender: self)
    }
    
    @IBAction func level1ButtonPressed(){
        
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

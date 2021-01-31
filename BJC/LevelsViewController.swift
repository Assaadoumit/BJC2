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

class LevelsViewController: UIViewController , GADInterstitialDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var liveCounting: UIButton!
    @IBOutlet weak var Level2Pressed: UIButton!
    @IBOutlet weak var Level1Pressed: UIButton!
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        navigationController?.navigationBar.barTintColor = .clear
        
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self;
        
        Level1Pressed.layer.cornerRadius = 30
        Level2Pressed.layer.cornerRadius = 30
        liveCounting.layer.cornerRadius = 30
        
        bannerView.adUnitID = "ca-app-pub-9955020715877598/8898923532"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        //        addBackButton()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer!.isEnabled = true
        
    }
    //    func addBackButton() {
    //        let backButton = UIButton(type: .custom)
    //        backButton.setImage(UIImage(named: "backButton"), for: .normal)
    //        backButton.setTitle("Back", for: .normal)
    //        backButton.setTitleColor(backButton.tintColor, for: .normal) // You can change the TitleColor
    //        backButton.addTarget(self, action: #selector(self.backAction(_:)), for: .touchUpInside)
    //
    //        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    //    }
    
    @IBAction func backAction(_ sender: UIButton) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    @IBAction func liveCounting(_ sender: Any) {
        
        let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "LiveCountingViewController")) as! LiveCountingViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)

    }
    
    @IBAction func level1ButtonPressed(){
        let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "ViewController")) as! ViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    @IBAction func level2ButtonPressed(){
        let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "Level2ViewController")) as! Level2ViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
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

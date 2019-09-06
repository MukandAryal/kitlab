//
//  MenuViewController.swift
//  KrescentITLab
//
//  Created by osvinuser on 14/05/19.
//  Copyright © 2019 osvinuser. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var homeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.clipsToBounds = true
        firstView.layer.cornerRadius = 20
        firstView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMinYCorner]
      
        secondView.clipsToBounds = true
        secondView.layer.cornerRadius = 20
        secondView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMinYCorner]
        
        thirdView.clipsToBounds = true
        thirdView.layer.cornerRadius = 20
        thirdView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMinYCorner]
     
        fourthView.clipsToBounds = true
        fourthView.layer.cornerRadius = 20
        fourthView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMinYCorner]
        
         self.navigationController?.navigationBar.isHidden = true
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func actionHome(_ sender: Any) {
        let homeObj = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(homeObj, animated: true)
    }
    
    @IBAction func actionServiceOffered(_ sender: Any) {
        
        let serviceObj = self.storyboard?.instantiateViewController(withIdentifier: "ServiceOfferedViewController") as! ServiceOfferedViewController
        self.navigationController?.pushViewController(serviceObj, animated: true)
    }
    
    @IBAction func actionPortfolio(_ sender: Any) {
        let portfolioObj = self.storyboard?.instantiateViewController(withIdentifier: "PortfolioViewController") as! PortfolioViewController
        self.navigationController?.pushViewController(portfolioObj, animated: true)
    }
    
    @IBAction func actionContactUs(_ sender: Any) {
        
        let contactUsObj = self.storyboard?.instantiateViewController(withIdentifier: "ContactUSViewController") as! ContactUSViewController
        self.navigationController?.pushViewController(contactUsObj, animated: true)
    }
}




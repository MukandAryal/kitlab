//
//  PortfolioViewController.swift
//  KrescentITLab
//
//  Created by osvinuser on 20/05/19.
//  Copyright © 2019 osvinuser. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {
    @IBOutlet weak var portfolio_CollectionVoew: UICollectionView!
    
  var portfolioImages: [UIImage] =   [UIImage(named: "tamaas.png")!,UIImage(named: "tabi.png")!,UIImage(named: "cravi.png")!,UIImage(named: "kongo.png")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func actionBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension PortfolioViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 200)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1     //return number of sections in collection view
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return portfolioImages.count   //return number of rows in section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "protfolio_cell", for: indexPath) as! protfolio_cell_CollectionViewCell
        cell.portfolio_Img.image = portfolioImages[indexPath.row]
        return cell      //return your cell
    }
}

extension PortfolioViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
        UIApplication.shared.openURL(NSURL(string: "https://apps.apple.com/us/app/tamaaas-messenger/id1449952054?l=es")! as URL)
        }else if indexPath.row == 1{
            UIApplication.shared.openURL(NSURL(string: "https://apps.apple.com/us/app/tabibakum/id1473132755")! as URL)
        }else if indexPath.row == 2{
            UIApplication.shared.openURL(NSURL(string: "https://itunes.apple.com/us/app/cravi/id686296396?mt=8%E2%80%8E")! as URL)
        }else{
            UIApplication.shared.openURL(NSURL(string: "https://itunes.apple.com/us/app/kungo-ride/id1400800966?mt=8&ign-mpt=uo%3D4")! as URL)
        }
    }
}



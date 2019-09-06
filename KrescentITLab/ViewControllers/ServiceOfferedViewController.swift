//
//  ServiceOfferedViewController.swift
//  KrescentITLab
//
//  Created by osvinuser on 21/05/19.
//  Copyright © 2019 osvinuser. All rights reserved.
//

import UIKit
import YNExpandableCell

class ServiceOfferedViewController: UIViewController,YNTableViewDelegate {
    @IBOutlet weak var serviceOffered_CollectionView: UICollectionView!
    @IBOutlet var ynTableView: YNTableView!
    
    
    var portfolioImages: [UIImage] =   [UIImage(named: "iphone.png")!,UIImage(named: "android_app.png")!,UIImage(named: "zoro.png")!,UIImage(named: "magento.png")!,UIImage(named: "sales.png")!,UIImage(named: "mongo.png")!]
    var serviceName = ["Iphone","Android","PHP","ZOHO","Magento","Salesforce","Mongo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ServiceOfferedCollectionViewCell", bundle: nil)
        serviceOffered_CollectionView?.register(nib, forCellWithReuseIdentifier: "ServiceOfferedCollectionViewCell")        // Do any additional setup after loading the view.
       // self.navigationController?.isNavigationBarHidden = true
        
        let cells = ["YNExpandableCellEx","YNSliderCell","YNSegmentCell","YNFutureCell","YNCloudCell"]
        self.ynTableView.registerCellsWith(nibNames: cells, and: cells)
        self.ynTableView.registerCellsWith(cells: [UITableViewCell.self as AnyClass], and: ["YNNonExpandableCell"])
        
        self.ynTableView.ynDelegate = self
        self.ynTableView.ynTableViewRowAnimation = .top
        ynTableView.tableFooterView = UIView()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func tableView(_ tableView: YNTableView, expandCellWithHeightAt indexPath: IndexPath) -> YNTableViewCell? {
        let ynSliderCell = YNTableViewCell()
        ynSliderCell.cell = tableView.dequeueReusableCell(withIdentifier: YNSliderCell.ID) as! YNSliderCell
        ynSliderCell.height = 270
        
        
        let ynSegmentCell = YNTableViewCell()
        ynSegmentCell.cell = tableView.dequeueReusableCell(withIdentifier: YNSegmentCell.ID) as! YNSegmentCell
        ynSegmentCell.height = 270
        
        let FutureAppTableViewCell = YNTableViewCell()
        FutureAppTableViewCell.cell = tableView.dequeueReusableCell(withIdentifier: YNFutureCell.ID) as! YNFutureCell
        FutureAppTableViewCell.height = 270
        
        let CloudTableViewCell = YNTableViewCell()
        CloudTableViewCell.cell = tableView.dequeueReusableCell(withIdentifier: YNCloudCell.ID) as! YNCloudCell
        CloudTableViewCell.height = 270
        
        if indexPath.section == 0 && indexPath.row == 0 {
            return ynSegmentCell
        } else if indexPath.section == 0 && indexPath.row == 1 {
            return ynSliderCell
        } else if indexPath.section == 0 && indexPath.row == 2 {
            return FutureAppTableViewCell
        } else if indexPath.section == 0 && indexPath.row == 3 {
            return CloudTableViewCell
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expandableCell = tableView.dequeueReusableCell(withIdentifier: YNExpandableCellEx.ID) as! YNExpandableCellEx
        if indexPath.section == 0 && indexPath.row == 0 {
            expandableCell.titleLabel.text = "Mobile App Development"
            expandableCell.image_View.image = UIImage.init(named: "mobile")
        } else if indexPath.section == 0 && indexPath.row == 1 {
            expandableCell.titleLabel.text = "Wwb & CMS Developement"
            expandableCell.image_View.image = UIImage.init(named: "web")
        } else if indexPath.section == 0 && indexPath.row == 2 {
            expandableCell.titleLabel.text = "Future of Apps Development"
            expandableCell.image_View.image = UIImage.init(named: "future")
        }
        else if indexPath.section == 0 && indexPath.row == 3 {
            expandableCell.titleLabel.text = "Cloud Services"
            expandableCell.image_View.image = UIImage.init(named: "cloud")
        }
        return expandableCell
    }
    
    func tableView(_ tableView: YNTableView, didSelectRowAt indexPath: IndexPath, isExpandableCell: Bool, isExpandedCell: Bool) {
        print("Selected Section: \(indexPath.section) Row: \(indexPath.row) isExpandableCell: \(isExpandableCell) isExpandedCell: \(isExpandedCell)")
    }
    
    func tableView(_ tableView: YNTableView, didDeselectRowAt indexPath: IndexPath, isExpandableCell: Bool, isExpandedCell: Bool) {
        print("Deselected Section: \(indexPath.section) Row: \(indexPath.row) isExpandableCell: \(isExpandableCell) isExpandedCell: \(isExpandedCell)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    @IBAction func actionBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ServiceOfferedViewController : UICollectionViewDelegate {
}

extension ServiceOfferedViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 180)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return portfolioImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceOfferedCollectionViewCell", for: indexPath) as! ServiceOfferedCollectionViewCell
        cell.service_imgView.image = portfolioImages[indexPath.row]
        cell.service_name.text = serviceName[indexPath.row]
        return cell
    }
}

//
//  ServiceOfferedCollectionViewCell.swift
//  KrescentITLab
//
//  Created by osvinuser on 21/05/19.
//  Copyright © 2019 osvinuser. All rights reserved.
//

import UIKit

class ServiceOfferedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var service_view: UIView!
    @IBOutlet weak var service_imgView: UIImageView!
    @IBOutlet weak var service_name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        addGradientToView()
        // Initialization code
    }
    
    func addGradientToView()
    {
        //gradient layer
        let gradientLayer = CAGradientLayer()
        
        //define colors
        gradientLayer.colors = [UIColor.white.cgColor,  UIColor(red: 50.0/255, green: 150.0/255, blue: 65.0/255, alpha: 1.0)]
        
        //define locations of colors as NSNumbers in range from 0.0 to 1.0
        //if locations not provided the colors will spread evenly
        gradientLayer.locations = [0.0, 0.6, 0.6]
        
        //define frame
        gradientLayer.frame = service_view.bounds
        
        //insert the gradient layer to the view layer
        service_view.layer.insertSublayer(gradientLayer, at: 0)
    }
}



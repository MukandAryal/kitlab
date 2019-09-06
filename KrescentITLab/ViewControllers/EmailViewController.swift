//
//  EmailViewController.swift
//  KrescentITLab
//
//  Created by Apple SSD2 on 06/09/19.
//  Copyright © 2019 osvinuser. All rights reserved.
//

import UIKit
import UITextView_Placeholder

class EmailViewController: UIViewController {

    @IBOutlet weak var emailName_textFled: UITextField!
    @IBOutlet weak var send_email: UIButton!
    @IBOutlet weak var shareText_view: UITextView!
    @IBOutlet weak var shareYourQuery_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    shareYourQuery_view.layer.borderWidth = 1
    shareText_view.layer.borderColor = UIColor(red: 52/255.0, green: 75/255.0, blue: 113/255.0, alpha: 1.0).cgColor
    shareText_view.placeholder = "Share Your Query!"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

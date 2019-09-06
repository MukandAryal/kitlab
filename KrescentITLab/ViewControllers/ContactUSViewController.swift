//
//  ContactUSViewController.swift
//  KrescentITLab
//
//  Created by osvinuser on 20/05/19.
//  Copyright © 2019 osvinuser. All rights reserved.
//

import UIKit

typealias UIButtonTargetClosure = (UIButton) -> ()

class ContactUSViewController: UIViewController {
    @IBOutlet weak var headQuarter_ImgView: UIImageView!
    @IBOutlet weak var callUs_Btn: UIButton!
    
    @IBOutlet weak var emailUs_Btn: UIButton!
    @IBOutlet weak var developmentCenter_ImaView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationController?.navigationBar.isHidden = true
        headQuarter_ImgView.layer.cornerRadius = headQuarter_ImgView.frame.width/2
        headQuarter_ImgView.clipsToBounds = true
        
        developmentCenter_ImaView.layer.cornerRadius = developmentCenter_ImaView.frame.width/2
        developmentCenter_ImaView.clipsToBounds = true
        
        callUs_Btn.layer.cornerRadius = 10
        callUs_Btn.clipsToBounds = true
        
        emailUs_Btn.layer.cornerRadius = 10
        emailUs_Btn.clipsToBounds = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func phoneCustomDialog(animated: Bool = true) {
        
        // Create a custom view controller
        let exitVc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneContactViewController") as? PhoneContactViewController
        
        
        
        // Create the dialog
        let popup = PopupDialog(viewController: exitVc!,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                tapGestureDismissal: true,
                                panGestureDismissal: true)
        
        exitVc?.callUs_lbl.text = "Call Us"
        exitVc?.us_phoneNmbr.text = "+1-510-854-8872"
        exitVc?.india_nmbr.text = "+91-172-4182778"
        present(popup, animated: animated, completion: nil)
    }
    
    func emailCustomDialog(animated: Bool = true) {
        
        // Create a custom view controller
        let exitVc = self.storyboard?.instantiateViewController(withIdentifier: "EmailViewController") as? EmailViewController
        
        
        
        // Create the dialog
        let popup = PopupDialog(viewController: exitVc!,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                tapGestureDismissal: true,
                                panGestureDismissal: true)
        
        exitVc!.send_email.addTargetClosure { _ in
            popup.dismiss()
                self.openEmail()
            }
        present(popup, animated: animated, completion: nil)
    }
    
    func openEmail(){
        let email = "info@krescentglobal.com"
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        controller.dismiss(animated: true)
//    }
    
    
    @IBAction func actionCallBtn(_ sender: Any) {
        self.phoneCustomDialog()
    }
    
    @IBAction func actionEmailBtn(_ sender: Any) {
        self.emailCustomDialog()
    }
    
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UIButton {
    
    private struct AssociatedKeys {
        static var targetClosure = "targetClosure"
    }
    
    private var targetClosure: UIButtonTargetClosure? {
        get {
            guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? ClosureWrapper else { return nil }
            return closureWrapper.closure
        }
        set(newValue) {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(self, &AssociatedKeys.targetClosure, ClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addTargetClosure(closure: @escaping UIButtonTargetClosure) {
        targetClosure = closure
        addTarget(self, action: #selector(UIButton.closureAction), for: .touchUpInside)
    }
    
    @objc func closureAction() {
        guard let targetClosure = targetClosure else { return }
        targetClosure(self)
    }
}
class ClosureWrapper: NSObject {
    let closure: UIButtonTargetClosure
    init(_ closure: @escaping UIButtonTargetClosure) {
        self.closure = closure
    }
}
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}



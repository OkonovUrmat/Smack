//
//  EditProfileVC.swift
//  Smack
//
//  Created by Urmat on 5/6/20.
//  Copyright © 2020 Urmat. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {

    //Outlets
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(EditProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        nameTxt.text = UserDataService.instance.name
    }
    
    @IBAction func editName(_ sender: Any) {
        guard let name = nameTxt.text else { return }
        AuthService.instance.updateUserById(name: name) { (success) in
            if success {
                AuthService.instance.findUserByEmail { (success) in
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func closeTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

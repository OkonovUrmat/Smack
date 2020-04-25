//
//  ProfileVC.swift
//  Smack
//
//  Created by Urmat on 4/25/20.
//  Copyright © 2020 Urmat. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    //Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func logoutPressed(_ sender: Any) {
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
    }
    
}

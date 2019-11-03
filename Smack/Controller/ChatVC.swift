//
//  ChatVC.swift
//  Smack
//
//  Created by Urmat on 7/18/19.
//  Copyright © 2019 Urmat. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //Outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Выпадающее меню слева
        menuBtn.addTarget(self.revealViewController(), action: #selector(revealViewController().revealToggle(_:)), for: .touchUpInside)
        //Раскрытие меню путем перетягивания
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
}

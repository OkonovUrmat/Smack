//
//  AvatarPickerVC.swift
//  Smack
//
//  Created by Urmat on 11/3/19.
//  Copyright © 2019 Urmat. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController {

    //Outlets
    @IBOutlet weak var collectionVIew: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

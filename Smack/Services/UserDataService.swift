//
//  UserDataService.swift
//  Smack
//
//  Created by Urmat on 9/19/19.
//  Copyright © 2019 Urmat. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = "" // public mean that id we can get from every class, private(set) setting id is a private
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""

    func setUserData(id: String, color: String, avatarName: String, email: String, name: String){
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
}

//
//  Constans.swift
//  Smack
//
//  Created by Urmat on 7/19/19.
//  Copyright © 2019 Urmat. All rights reserved.
//

import Foundation

//Проверяем удачно ли прошла авторизация или нет
// -> () - передача данных в функцию
typealias CompletionHandler = (_ Success: Bool) -> ()

//Что такое typealias
//Переименования типа данных

//typealias Jonny = String
//let name: Jonny = "Jonny"

//URL
let BASE_URL = "http://localhost:3005/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel/"

// Colors
let smackPurplePlaceholder = #colorLiteral(red: 0.3254901961, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5)

// Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_CHANNELS_SELECTED = Notification.Name("channelsSelected")

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//Headers
let HEADER = ["Content-Type": "application/json; charset=utf-8"] //Заголовок как в Postman

let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.auth)",
    "Content-Type": "application/json; charset=utf-8"
]

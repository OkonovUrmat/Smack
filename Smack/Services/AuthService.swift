//
//  AuthService.swift
//  Smack
//
//  Created by Urmat on 7/21/19.
//  Copyright © 2019 Urmat. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    //Зашел пользователь
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    //Регистрация
    var auth: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    //Почта пользователя
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    //Регистрация пользователя
    func registerUser(email:String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased() //Делаем весь email нижним регистром
        
        let body: [String: Any] = [ //Атрибуты которые переводим
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
            
        }
        
    }
    //Вход пользователя
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased() //Делаем весь email нижним регистром
        
        let body: [String: Any] = [ //Атрибуты которые переводим
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            //Что должно быть результаттом как в Postman
            if response.result.error == nil {
                //                if let json = response.result.value as? Dictionary<String,Any> {
                //                    if let email = json["user"] as? String { //В postman email выводится результатом как user
                //                        self.userEmail = email //В следствии чего мы введенный email приравниваем к user self.userEmail это user в результатах
                //                    }
                //                    if let token = json["token"] as? String { //Здесь auth это токен авторизированного пользователя и он передается как результат
                //                        self.auth = token
                //                    }
                //                }
                
                //Using SwiftyJSON
                
                guard let data = response.data else { return }
                let json = JSON(data : data)
                self.userEmail = json["user"].stringValue
                self.auth = json["token"].stringValue
                
                self.isLoggedIn = true
                completion(true)
            }
            else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
            
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased() //Делаем весь email нижним регистром
        
        let body: [String: Any] = [ //Атрибуты которые переводим
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                self.setUserInfo(data: data)
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findUserByEmail(completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_USER_BY_EMAIL)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                self.setUserInfo(data: data)
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func setUserInfo(data: Data){
        let json = JSON(data: data)
        let id = json["_id"].stringValue
        let color = json["avatarColor"].stringValue
        let avatarName = json["avatarName"].stringValue
        let email = json["email"].stringValue
        let name = json["name"].stringValue
        
        UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email
            , name: name)
    }
    
}

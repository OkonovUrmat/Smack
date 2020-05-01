//
//  Screen.swift
//  Smack
//
//  Created by Urmat on 5/1/20.
//  Copyright © 2020 Urmat. All rights reserved.
//

import Foundation

class Screen {
        static let bounds = UIScreen.main.bounds
    //    static let width  = bounds.width
        static let height = bounds.height
        
        static let width: CGFloat = {
            let width = bounds.width
            if UIDevice().userInterfaceIdiom == .pad {
                
            }
            return width
        }()
        
        static var SideMenuWidth = CGFloat(0.0) // used only for iPad

        static var isPlusScreenDevice: Bool {
            var result: Bool = false
            if UIDevice().userInterfaceIdiom == .phone {
                if Screen.height > 700 {
                    result = true
                }
            }
            return result
        }
        
        static var isSmallDevice: Bool {
            return (UIScreen.main.nativeBounds.height <= 1136)
        }
        
        static var isIpadDevice: Bool {
            return (UIDevice.current.userInterfaceIdiom == .pad)
        }
        
        static var isiPhoneXDevice: Bool {
            return UIScreen.main.bounds.height >= 812
        }
}

//
//  Channel.swift
//  Smack
//
//  Created by Urmat on 4/28/20.
//  Copyright © 2020 Urmat. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}

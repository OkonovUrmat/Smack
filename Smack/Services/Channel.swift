//
//  Channel.swift
//  Smack
//
//  Created by Urmat on 4/28/20.
//  Copyright © 2020 Urmat. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int!
}

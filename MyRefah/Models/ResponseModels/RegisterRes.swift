//
//  RegisterRes.swift
//  MyRefah
//
//  Created by tisa refah on 7/31/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import Foundation

struct RegisterRes : Codable {
    
    let accessToken : String?
    let refreshToken : String?
    
    enum CodingKeys: String, CodingKey {
        
        case accessToken = "accessToken"
        case refreshToken = "refreshToken"
    }
    
}

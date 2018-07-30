//
//  App.swift
//  MyRefah
//
//  Created by tisa refah on 7/30/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import Foundation
import UIKit

public class App {
    
    static let defaults: UserDefaults = UserDefaults.standard
    
    static let uuid : String = UIDevice.current.identifierForVendor!.uuidString
    
    static var decoder : JSONDecoder {
        get{
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            return decoder
        }
    }
    
}

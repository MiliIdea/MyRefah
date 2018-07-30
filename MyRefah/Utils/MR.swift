//
//  MR.swift
//  MyRefah
//
//  Created by tisa refah on 7/30/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import CodableAlamofire
import Toast_Swift

// MR = MyRequests
public class MR {
    
    static func register(vc : UIViewController , phone : String  ,_ withLoading : Bool = true , completionHandler: @escaping (LoginRes?) -> Void){
        
//        var l : LoadingViewController? = nil
//        if(withLoading){l = App.showLoading(vc: vc)}
        print( ["mobile" : phone])
        request(URLs.login, method: .post , parameters: ["mobile" : phone] , encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<LoginRes>) in
//            if(withLoading){l!.disView()}
//            resHandler(vc , res: response.result.value){ res in
//                completionHandler(res)
//            }

            print(response.result.value)
            
            completionHandler(response.result.value)
            
        }
        
    }
    
}

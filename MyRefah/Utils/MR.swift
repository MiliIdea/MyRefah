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
    
    
    //************************** ALL REQUESTs **************************//
    
    
    static func register(vc : UIViewController , phone : String  ,_ withLoading : Bool = true , completionHandler: @escaping (Data<LoginRes>?) -> Void){
        request(URLs.login, method: .post , parameters: ["mobile" : phone] , encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<Data<LoginRes>>) in
            self.resHandler(vc: vc, response: response){res in
                completionHandler(res?.result.value)
            }
        }
        
    }
    
    
    static func activate(vc : UIViewController , phone : String , code : String  ,_ withLoading : Bool = true , completionHandler: @escaping (Data<RegisterRes>?) -> Void){
        request(URLs.register, method: .post , parameters: ["mobile" : phone , "code" : code] , encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<Data<RegisterRes>>) in
            self.resHandler(vc: vc, response: response){res in
                completionHandler(res?.result.value)
            }
        }
        
    }
    
    
    
    
    static func advertise(vc : UIViewController ,_ withLoading : Bool = true , completionHandler: @escaping (Data<[DiscountRes]>?) -> Void){
        request(URLs.getAdvertise, method: .get , parameters: [:] , encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<Data<[DiscountRes]>>) in
            self.resHandler(vc: vc, response: response){res in
                completionHandler(res?.result.value)
            }
        }
        
    }
    
    
    
    
    static func discounts(vc : UIViewController ,page : Int = 0 , numInPage : Int = 20 ,_ withLoading : Bool = true , completionHandler: @escaping (Data<[DiscountRes]>?) -> Void){
        //+ "/" + numInPage.description
        let disURL : String = URLs.getDiscounts + page.description
        request(disURL, method: .get ).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<Data<[DiscountRes]>>) in
            self.resHandler(vc: vc, response: response){res in
                completionHandler(res?.result.value)
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    static func resHandler<T>(vc : UIViewController , response : DataResponse<Data<T>> , completionHandler: @escaping (DataResponse<Data<T>>?) -> Void){
        vc.view.isUserInteractionEnabled = true
        print(response.response?.debugDescription)
        print()
        print(response.response?.statusCode)
        if(response.response?.statusCode == 200){
            completionHandler(response)
        }else{
            if(response.response?.statusCode == 400){
                if let data = response.data {
                    //                        let json = String(data: data, encoding: String.Encoding.utf8)
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Dictionary<String,Any>
                        {
                            var errors : String = ""
                            var count = 1
                            for s in (json.first?.value as! [String]) {
                                errors.append(s)
                                if(json.count > count){
                                    errors.append("\n")
                                    count += 1
                                }
                            }
                            vc.view.makeToast(errors)
                            
                        } else {
                            print("bad json")
                            vc.view.makeToast("خطایی رخ داده است")
                        }
                    } catch let error as NSError {
                        print(error)
                        vc.view.makeToast("خطایی رخ داده است")
                    }
                    
                }else{
                    vc.view.makeToast("خطایی رخ داده است")
                }
            }else{
                vc.view.makeToast("خطایی رخ داده است")
            }
        }
    }
}

































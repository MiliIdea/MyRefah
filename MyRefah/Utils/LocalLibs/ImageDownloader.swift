//
//  ImageDownloader.swift
//  MyRefah
//
//  Created by tisa refah on 8/5/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import Foundation
import Alamofire
import Disk
import CodableAlamofire
import UIKit

class ImageDownloader {
    
    static func loadImage(url : String , completionHandler: @escaping (UIImage?) -> Void){
    
        
        if App.cache.object(forKey: url as AnyObject) != nil {
                completionHandler(UIImage(data: App.cache.object(forKey: url as AnyObject) as! Foundation.Data)!)
        }else{
            if(Disk.exists(url, in: .documents)){
                do{
                    let retrievedImage : UIImage = try Disk.retrieve(url, from: .documents, as: UIImage.self)
                    App.cache.setObject(UIImagePNGRepresentation(retrievedImage) as AnyObject, forKey: url as AnyObject)
                    completionHandler(retrievedImage)
                }catch{
                    
                }
            }else{
                print("requested")
                request(url ,method: .get).responseString { response in
                    print(response)
                    if let image = response.result.value {
                        print("++++++++++++" , image)
                        let dataDecoded : Foundation.Data = Foundation.Data(base64Encoded: image, options: .ignoreUnknownCharacters)!
                        let decodedimage = UIImage(data: dataDecoded)
                        do{
                            try Disk.save(decodedimage!, to: .documents, as: url)
                        }catch{
                            
                        }
                        App.cache.setObject(dataDecoded as AnyObject, forKey: url as AnyObject)
                        completionHandler(decodedimage)
                    }
                }
            }
            
        }
            
        

        
    }
    
}

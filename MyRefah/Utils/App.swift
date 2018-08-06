//
//  App.swift
//  MyRefah
//
//  Created by tisa refah on 7/30/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import Foundation
import UIKit
import Lottie


public class App {
    
    static let defaults: UserDefaults = UserDefaults.standard
    
    static let uuid : String = UIDevice.current.identifierForVendor!.uuidString
    
    static var cache: NSCache<AnyObject, AnyObject> = NSCache()
    
    static var decoder : JSONDecoder {
        get{
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            return decoder
        }
    }
    
    static func showNetworkErrorPopup(vc : UIViewController){
        vc.view.endEditing(true)
        let popup : ErrorNetPopupViewController = (vc.storyboard?.instantiateViewController(withIdentifier: "ErrorNetPopupViewController"))! as! ErrorNetPopupViewController
        vc.addChildViewController(popup)
        vc.view.addSubview(popup.view)
        popup.didMove(toParentViewController: vc)
    }
    
    static func showLoading(vc : UIViewController , navBotOrigin : CGFloat){
        
        let h = vc.view.frame.height - navBotOrigin
        
        let w = vc.view.frame.width
        
        let loadingView : UIView = UIView.init(frame: .init(x: 0, y: navBotOrigin, width: w, height: h))
        
        let lotWidth = 180 * vc.view.frame.height / 677
        
        let lottieView : UIView = UIView.init(frame: .init(x: ((w / 2) - (lotWidth / 2)), y: ((h / 2) - (lotWidth / 2)) , width: lotWidth, height: lotWidth ))
        
        lottieView.backgroundColor = UIColor.clear
        
        lottieView.tag = 4321
        
        loadingView.addSubview(lottieView)
        
        loadingView.backgroundColor = UIColor.white
        
        loadingView.tag = 1234
        
        vc.view.addSubview(loadingView)
        
        var animationView :  LOTAnimationView?
        
        animationView = LOTAnimationView(name: "loading1")
        
        animationView?.frame.size = lottieView.frame.size
        
        animationView?.frame.origin = .init(x: 0, y: 0)
        
        animationView?.contentMode = UIViewContentMode.scaleAspectFit
        
        animationView?.alpha = 1
        
        lottieView.addSubview(animationView!)
        
        animationView?.loopAnimation = true
        
        animationView?.play()
        
        
    }
    
    
    static func dismissLoading(vc : UIViewController){
        
        let v = vc.view.viewWithTag(1234)
        
        if(v != nil){
            UIView.animate(withDuration: 0.2, delay: 0.0 , options: .curveEaseInOut, animations: {
                v?.alpha = 0
            }){completion in
                v?.removeFromSuperview()
            }
        }
        
    }
    
    
    

    
}


































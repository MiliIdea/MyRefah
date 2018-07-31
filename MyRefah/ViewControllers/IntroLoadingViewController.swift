//
//  IntroLoadingViewController.swift
//  MyRefah
//
//  Created by tisa refah on 7/31/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import DCKit
import UIColor_Hex_Swift

class IntroLoadingViewController: UIViewController {

    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    
    @IBOutlet weak var refahView: DCBorderedView!
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.refahView.frame.size.height = self.refahView.frame.width
        self.refahView.cornerRadius = self.refahView.frame.height / 2
        
        if(!self.haveInternet()){
            App.showNetworkErrorPopup(vc: self)
        }else{
            timer = Timer.scheduledTimer(timeInterval: 4 , target: self, selector: #selector(self.update), userInfo: nil, repeats: false)
        }
        
        loadingView.startAnimating()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @objc func update() {
       
        if(App.defaults.object(forKey: DefaultStrings.token) as? String != nil){
            // mire b index
            let vC : MainViewController = (self.storyboard?.instantiateViewController(withIdentifier: "MainViewController"))! as! MainViewController
            self.navigationController?.pushViewController(vC, animated: true)
            
        }else{
            //bayad bere b Login
            self.goLogin()
        }
        
    }
    
    func update2(){
        timer = Timer.scheduledTimer(timeInterval: 2 , target: self, selector: #selector(self.update), userInfo: nil, repeats: false)
    }
    

}

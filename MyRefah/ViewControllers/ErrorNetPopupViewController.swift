//
//  ErrorNetPopupViewController.swift
//  MyRefah
//
//  Created by tisa refah on 7/31/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import UIKit


class ErrorNetPopupViewController: UIViewController {

    
    @IBOutlet weak var popupView: GradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popupView.frame.origin.y = self.view.frame.height
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        runPopup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func retry(_ sender: Any) {
        if(self.haveInternet()){
            self.dissmissView()
        }else{
            self.view.makeToast("اشکال در برقراری به اینترنت رفع نشده است")
        }
    }
    

    @IBAction func goSettings(_ sender: Any) {
        let alertController = UIAlertController (title: "تنظیمات", message: "برای بررسی اینترنت به تنظیمات می روید؟", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "تنظیمات", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "بستن", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func dissmissView(){
        UIView.animate(withDuration: 0.5, delay: 0 , options: .curveEaseInOut, animations: {
            self.popupView.frame.origin.y = self.view.frame.height
        }){ completion in
            if(self.parent is IntroLoadingViewController){
                (self.parent as! IntroLoadingViewController).update2()
            }
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        }
    }
    
    func runPopup(){
        UIView.animate(withDuration: 0.5, delay: 0.0 , options: .curveEaseInOut, animations: {
            self.popupView.frame.origin.y = 0
        },completion : nil)
    }
    

}

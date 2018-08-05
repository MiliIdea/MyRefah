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
import Pastel

class IntroLoadingViewController: UIViewController {

    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    
    @IBOutlet weak var refahView: DCBorderedView!
    
    @IBOutlet weak var gradientView: GradientView!
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setGradient(view : self.gradientView)
        
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func haveInternet() -> Bool{
        guard let status = Network.reachability?.status else { return false}
        if(status == .unreachable){
            return false
        }else{
            return true
        }
    }
    
    func goLogin(){
        var isInStack = false
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: LoginViewController.self) {
                isInStack = true
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
        if(!isInStack){
            
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            let nav = UINavigationController(rootViewController: homeViewController)
            nav.setNavigationBarHidden(true, animated: false)
            nav.setToolbarHidden(true, animated: false)
            appdelegate.window!.rootViewController = nav
        }
    }
    
    
    func setGradient(view : UIView){
        let pastelView = PastelView(frame: view.bounds)
        
        // Custom Direction
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        // Custom Duration
        pastelView.animationDuration = 3
        
        pastelView.setColors([UIColor("#33b556") , UIColor("#113b4d")])
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
    }
    
}


//
//  ViewController.swift
//  MyRefah
//
//  Created by tisa refah on 7/29/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import UIKit
import SACodedTextField
import UIColor_Hex_Swift


class LoginViewController: UIViewController {

    @IBOutlet weak var inputText: ActivationCodeTextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if(!self.haveInternet()){
            App.showNetworkErrorPopup(vc: self)
        }
        
        self.hideKeyboardWhenTappedAround()
        
        inputText.maxCodeLength = 11
        
        inputText.text = "09"
        
        inputText.textColor = UIColor("#6BA563")
        
        inputText.font = UIFont.init(name: "IRANSansFaNum", size: 18)
        
        inputText.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        if(inputText.text?.count != 11){
            self.view.makeToast("لطفا شماره موبایل را کامل وارد کنید")
            return
        }
        self.view.isUserInteractionEnabled = false
        MR.register(vc: self, phone: self.inputText.text! ){ res in
            let vC : ActivationViewController = (self.storyboard?.instantiateViewController(withIdentifier: "ActivationViewController"))! as! ActivationViewController
            vC.mobile = self.inputText.text!
            self.navigationController?.pushViewController(vC, animated: true)
            
        }
        
    }
  
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(self.inputText.text?.count == 11){
            self.view.endEditing(true)
        }
        if((self.inputText.text?.count)! <= 2){
            self.inputText.text = "09"
        }
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
    
    
}


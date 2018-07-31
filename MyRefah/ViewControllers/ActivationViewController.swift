//
//  ActivationViewController.swift
//  MyRefah
//
//  Created by tisa refah on 7/31/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift
import SACodedTextField



class ActivationViewController: UIViewController {

    @IBOutlet weak var topMobileTitle: UILabel!
    
    @IBOutlet weak var activationCode: ActivationCodeTextField!
    
    @IBOutlet weak var resendButton: UIButton!
    
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    var mobile : String = ""
    
    var timer : Timer?
    
    var counter : Int = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        
        activationCode.maxCodeLength = 5
        
        activationCode.textColor = UIColor("#6BA563")
        
        activationCode.font = UIFont.init(name: "IRANSansFaNum", size: 18)
        
        self.topMobileTitle.text = "کد ارسال شده به شماره " + mobile + " را وارد کنید"
        
        self.remainingTimeLabel.text = counter.description + "ثانیه تا امکان ارسال مجدد "
        
        self.remainingTimeLabel.alpha = 1
        
        self.resendButton.alpha = 0
        
        self.resendButton.isEnabled = false
        
        self.activationCode.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        
        timer = Timer.scheduledTimer(timeInterval: 1 , target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func activate(_ sender: Any) {
        self.view.isUserInteractionEnabled = false
        MR.activate(vc: self, phone: mobile, code: self.activationCode.text! ){ res in
            App.defaults.set(res?.data?.accessToken , forKey: DefaultStrings.token)
            App.defaults.set(res?.data?.refreshToken , forKey: DefaultStrings.refreshToken)
            let vC : IntroLoadingViewController = (self.storyboard?.instantiateViewController(withIdentifier: "IntroLoadingViewController"))! as! IntroLoadingViewController
            self.navigationController?.pushViewController(vC, animated: true)
        }
    }
    
    @IBAction func resendCode(_ sender: Any) {
        //call service
        self.view.isUserInteractionEnabled = false
        MR.register(vc: self, phone: mobile){res in
            self.counter = 120
        }
    }
    
    @objc func update() {
        // Something cool
        if(counter != 0){
            counter -= 1
            self.remainingTimeLabel.text = counter.description + "ثانیه تا امکان ارسال مجدد "
            self.remainingTimeLabel.alpha = 1
            self.resendButton.alpha = 0
            self.resendButton.isEnabled = false
        }else{
            self.remainingTimeLabel.alpha = 0
            self.resendButton.alpha = 1
            self.resendButton.isEnabled = true
        }
        
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(self.activationCode.text?.count == 5){
            self.view.endEditing(true)
        }
    }

}





















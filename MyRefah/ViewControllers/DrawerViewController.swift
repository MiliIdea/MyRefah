//
//  DrawerViewController.swift
//  MyRefah
//
//  Created by tisa refah on 8/5/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func goProfile(_ sender: Any) {
    }
    
    @IBAction func goMessages(_ sender: Any) {
    }
    
    @IBAction func goNews(_ sender: Any) {
    }
    
    @IBAction func goContactUs(_ sender: Any) {
    }
    
    @IBAction func goAboutUs(_ sender: Any) {
    }
    
    @IBAction func logout(_ sender: Any) {
        App.defaults.set(nil, forKey: DefaultStrings.token)
        self.goLogin()
    }
    
    

}
















































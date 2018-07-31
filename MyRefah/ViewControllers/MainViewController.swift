//
//  MainViewController.swift
//  MyRefah
//
//  Created by tisa refah on 7/31/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: Any) {
        App.defaults.set(nil, forKey: DefaultStrings.token)
        self.goLogin()
    }
    
    

}

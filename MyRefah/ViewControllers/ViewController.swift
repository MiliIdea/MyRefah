//
//  ViewController.swift
//  MyRefah
//
//  Created by tisa refah on 7/29/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        
        MR.register(vc: self, phone: self.inputText.text! ){ res in
            
            print(res)
            print()
        }
        
    }
    
}



//
//  DiscountViewController.swift
//  MyRefah
//
//  Created by tisa refah on 8/5/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import UIKit

class DiscountViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource{

    
    @IBOutlet weak var table: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.table.register(UINib(nibName: "DiscountTableViewCell", bundle: nil), forCellReuseIdentifier:"DiscountTableViewCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : DiscountTableViewCell = table.dequeueReusableCell(withIdentifier: "DiscountTableViewCell", for: indexPath as IndexPath) as! DiscountTableViewCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 178 * self.view.frame.height / 667
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
    }

}















































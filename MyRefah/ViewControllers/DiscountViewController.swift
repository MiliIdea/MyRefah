
//
//  DiscountViewController.swift
//  MyRefah
//
//  Created by tisa refah on 8/5/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import UIKit
import Kingfisher

class DiscountViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource{

    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var navigationView: GradientView!
    
    var discounts : [DiscountRes] = [DiscountRes]()
    
    var images : [UIImage?] = [UIImage?]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.table.register(UINib(nibName: "DiscountTableViewCell", bundle: nil), forCellReuseIdentifier:"DiscountTableViewCell")
        
        self.table.delegate = self
        
        self.table.dataSource = self
        
        App.showLoading(vc: self, navBotOrigin: self.navigationView.frame.height + self.navigationView.frame.origin.y)
        MR.discounts(vc: self){res in
            App.dismissLoading(vc: self)
            if(res?.data != nil && (res?.data?.count)! > 0){
                self.discounts = (res?.data)!
                for i in 0...(self.discounts.count - 1) {
                    self.images.append(nil)
                }
                self.table.reloadData()
            }
        }
        
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
        return Int(discounts.count / 2)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : DiscountTableViewCell = table.dequeueReusableCell(withIdentifier: "DiscountTableViewCell", for: indexPath as IndexPath) as! DiscountTableViewCell

        let c : DiscountRes = discounts[2 * indexPath.row]
        if(images[2 * indexPath.row] != nil){
            cell.leftButton.setBackgroundImage(images[2 * indexPath.row], for: .normal)
        }else{
            cell.leftButton.dl(url: c.attachment!){img in
                self.images[2 * indexPath.row] = img
            }
        }
        
        let c2 : DiscountRes?
        if(discounts.count - 1 >= 2 * indexPath.row + 1 ){
            c2 = discounts[2 * indexPath.row + 1]
            if(images[2 * indexPath.row + 1] != nil){
                cell.rightButton.setBackgroundImage(images[2 * indexPath.row + 1], for: .normal)
            }else{
                cell.rightButton.dl(url: (c2?.attachment!)!){img in
                    self.images[2 * indexPath.row + 1] = img
                }
            }
            
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 178 * self.view.frame.height / 667
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
    }

}















































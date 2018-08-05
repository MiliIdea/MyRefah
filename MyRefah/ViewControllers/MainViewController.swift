//
//  MainViewController.swift
//  MyRefah
//
//  Created by tisa refah on 7/31/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import UIKit
import Spring


class MainViewController: UIViewController {

    
    @IBOutlet weak var gradientView: GradientView!
    var firstPoints : [CGPoint] = [CGPoint]()
    let animationTime = 0.5
    var fireAnimateCount = 1
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...6 {
            let v = self.view.viewWithTag(i)
            let x = ((v?.frame.origin)!.x + ((v?.frame.width)! / 2))
            let y = ((v?.frame.origin)!.y + ((v?.frame.height)! / 2))
            firstPoints.append(.init(x: x , y: y))
        }
        for i in 1...6 {
            setFirstPosition(view: self.view.viewWithTag(i)!)
            print(self.view.viewWithTag(i)?.viewWithTag(2))
            if(self.view.viewWithTag(i)?.viewWithTag(21) != nil){(self.view.viewWithTag(i)?.viewWithTag(21) as! UIImageView).alpha = 0}
            if(self.view.viewWithTag(i)?.viewWithTag(20) != nil){(self.view.viewWithTag(i)?.viewWithTag(20) as! UILabel).alpha = 0}
        }
        
        if(timer != nil){
            timer?.invalidate()
        }
        fireAnimateCount = 1
        timer = Timer.scheduledTimer(timeInterval: animationTime - 0.2 , target: self, selector: #selector(self.runAnimateWithSequence), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func runAnimateWithSequence(){
        if(fireAnimateCount >= 1 && fireAnimateCount <= 6){
            moveViewInNonLinearPath(view: self.view.viewWithTag(fireAnimateCount)!, endPoint: firstPoints[fireAnimateCount - 1])
            fireAnimateCount += 1
        }else if(fireAnimateCount > 6 && timer != nil){
            timer?.invalidate()
        }
    }

    @IBAction func goToDrawer(_ sender: Any) {
        let vC : DrawerViewController = (self.storyboard?.instantiateViewController(withIdentifier: "DrawerViewController"))! as! DrawerViewController
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    
    
    
    
    @IBAction func logout(_ sender: Any) {
        
        UIView.animate(withDuration: 0.2, delay: 0.0 , usingSpringWithDamping: 0.5 , initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            for i in 1...6 {
                self.setFirstPosition(view: self.view.viewWithTag(i)!)
            }
        }){completion in
            if(self.timer != nil){
                self.timer?.invalidate()
            }
            self.fireAnimateCount = 1
            
            self.timer = Timer.scheduledTimer(timeInterval: self.animationTime - 0.2 , target: self, selector: #selector(self.runAnimateWithSequence), userInfo: nil, repeats: true)
        }
        
        
    }
    
    
    func setFirstPosition(view : UIView){
        view.frame.origin.x = self.view.frame.width
        view.frame.origin.y = self.view.frame.height
    }
    
    func moveViewInNonLinearPath(view : UIView , endPoint : CGPoint){
        let keyFrameAnimation = CAKeyframeAnimation(keyPath:"position")
        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: self.view.frame.width, y: self.view.frame.height))
        path.addQuadCurve(to: endPoint, controlPoint: CGPoint(x: self.view.frame.width / 6, y: self.view.frame.height))
        keyFrameAnimation.path = path.cgPath
        keyFrameAnimation.duration = self.animationTime
        keyFrameAnimation.fillMode = kCAFillModeForwards
        keyFrameAnimation.isRemovedOnCompletion = false
        view.layer.add(keyFrameAnimation, forKey: "animation")

        UIView.animate(withDuration: 0.2, delay: self.animationTime - 0.25 , usingSpringWithDamping: 0.5 , initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            if(view.viewWithTag(21) != nil){(view.viewWithTag(21) as! UIImageView).alpha = 1}
            if(view.viewWithTag(20) != nil){(view.viewWithTag(20) as! UILabel).alpha = 1}
        }){completion in
            self.shakeView(vw: view)
        }
        
    }
    
    func shakeView(vw: UIView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 3, -3, 0 ]
        animation.keyTimes = [0, 0.25, 0.5, 0.75 , 1]
        animation.duration = 0.3
        animation.isAdditive = true
        
        vw.layer.add(animation, forKey: "shake")
    }
    
    @IBAction func goDiscount(_ sender: Any) {
        let vC : DiscountViewController = (self.storyboard?.instantiateViewController(withIdentifier: "DiscountViewController"))! as! DiscountViewController
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    @IBAction func goStore(_ sender: Any) {
    }
    
    @IBAction func goShoppingList(_ sender: Any) {
    }
    
    @IBAction func goBarcodeReader(_ sender: Any) {
    }
    
    @IBAction func goNews(_ sender: Any) {
    }
    
    @IBAction func goContactUs(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}


































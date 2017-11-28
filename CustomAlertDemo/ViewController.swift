//
//  ViewController.swift
//  CustomAlertDemo
//
//  Created by Sachin Thakur on 15/11/17.
//  Copyright © 2017 Paytm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let value : Int = 2
   
    var alertView :JRCustomPriceGridAlertView?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func actionToAddSubView(_ sender: UIButton)
    {
        alertView = JRCustomPriceGridAlertView.showViewWithFrame(self.view.frame, oldPrice: "\(500)", newPrice : "\(506)")
        alertView?.delegate = self
        if let haveView = alertView {
            self.view.addSubview(haveView)
            UIView.animate(withDuration: 1.0,
                           animations: {
                            haveView.alpha = 1.0
            },
                           completion: { _ in
                           
            }
            )
        }
    }
}

extension ViewController : JRCustomPriceGridAlertViewDelegate {
    
    func crossButtonTapped() {
        alertView?.removeFromSuperview()
    }
    func addToCartPriceButtonTapped() {
        
    }
    func doNotWantButtonTapped() {
        
    }
}


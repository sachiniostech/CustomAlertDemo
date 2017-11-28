//
//  CustomPriceAlertView.swift
//  CustomAlertDemo
//
//  Created by Sachin Thakur on 15/11/17.
//  Copyright © 2017 Paytm. All rights reserved.
//

import UIKit
@objc protocol JRCustomPriceGridAlertViewDelegate  {
    
    func crossButtonTapped()
    func addToCartPriceButtonTapped()
    func doNotWantButtonTapped()
}

class JRCustomPriceGridAlertView: UIView {

     @IBOutlet private weak var lblMsg: UILabel!
     @IBOutlet private weak var btnAddToCart: UIButton!
     @IBOutlet private weak var btndoNOtWant: UIButton!
     @IBOutlet private weak var containerView: UIView!
    
     weak var delegate:JRCustomPriceGridAlertViewDelegate?
     override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.borderWidth = 1.0
        containerView.layer.cornerRadius = 4.0
        btnAddToCart.layer.borderColor = UIColor.white.cgColor
        btnAddToCart.layer.borderWidth = 1.0
        btnAddToCart.layer.cornerRadius = 3.0
    }
    
    @IBAction func crossbuttonAction(_ sender: UIButton) {
        
       delegate?.crossButtonTapped()
    }
    @IBAction func addToCartPriceButtonAction(_ sender: UIButton) {
        
        delegate?.addToCartPriceButtonTapped()
    }
    @IBAction func doNotWantButtonAction(_ sender: UIButton) {
        
        delegate?.doNotWantButtonTapped()
    }
    
    
    class func showViewWithFrame(_ frame: CGRect, oldPrice: String?, newPrice : String?) -> JRCustomPriceGridAlertView {
        let alertView = Bundle.main.loadNibNamed("JRCustomPriceGridAlertView", owner: self, options: nil)?.last as! JRCustomPriceGridAlertView
        alertView.configureViewWithMessage(oldPrice: oldPrice, newPrice: newPrice)
        alertView.frame = frame
        return alertView
    }
   
    
    fileprivate func configureViewWithMessage(oldPrice: String?, newPrice: String?) {
        
        
        let msg = "Price of this item has been changed from ₹ \(oldPrice ?? "") to ₹ \(newPrice ?? "") due to seller change as the current seller cannot deliver to your Pincode." as String
        print(msg)
      
        self.lblMsg.attributedText = addBoldText(fullString: msg as NSString, boldPartsOfString: ["\(oldPrice ?? "")" as NSString, "\(newPrice ?? "")" as NSString], font: UIFont.systemFont(ofSize: 17), boldFont: UIFont.boldSystemFont(ofSize: 17))
        
        

        
        btnAddToCart.setTitle("Add to Cart for ₹ \(newPrice ?? "")", for: UIControlState.normal)
        btnAddToCart.titleLabel?.adjustsFontSizeToFitWidth = true
        btndoNOtWant.setTitle("I do not want this item", for: UIControlState.normal)
        
    }
    
    func addBoldText(fullString: NSString, boldPartsOfString: Array<NSString>, font: UIFont!, boldFont: UIFont!) -> NSAttributedString {
        let nonBoldFontAttribute = [NSAttributedStringKey.font:font!]
        let boldFontAttribute = [NSAttributedStringKey.font:boldFont!]
        let boldString = NSMutableAttributedString(string: fullString as String, attributes:nonBoldFontAttribute)
        for i in 0 ..< boldPartsOfString.count {
            boldString.addAttributes(boldFontAttribute, range: fullString.range(of: boldPartsOfString[i] as String))
        }
        return boldString
    }
}
    
   

    




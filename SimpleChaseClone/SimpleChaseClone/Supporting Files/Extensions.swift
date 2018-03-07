//
//  Extensions.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/1/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func disableAutoResizing() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UITextField {
    func setBottomBorder() {
        //        self.borderStyle = .none
        //        self.layer.backgroundColor = UIColor.white.cgColor
        //
        //        self.layer.masksToBounds = false
        //        self.layer.shadowColor = UIColor.gray.cgColor
        //        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        //        self.layer.shadowOpacity = 1.0
        //        self.layer.shadowRadius = 0.0
        
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

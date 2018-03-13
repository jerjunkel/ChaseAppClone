//
//  WhiteBoxView.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/1/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import Foundation
import UIKit

class BoxView: UIView {
    private var borderStyle: BoxViewBorderStyle = .none
    private var hasCorners: Bool = false
    
    enum BoxViewBorderStyle {
        case none, thin, heavy
    }

    convenience init (hasCorners: Bool, borderStyle: BoxViewBorderStyle){
        self.init()
        self.borderStyle = borderStyle
        self.hasCorners = hasCorners
        setUpView()
    }
    
    //MARK:- Utilities
    private func setUpView() {
        self.backgroundColor = .white
        self.disableAutoResizing()
        setBorderStyle()
        addCorner()
    }
    
    private func setBorderStyle() {
        switch borderStyle {
        case .heavy:
            self.layer.borderWidth = 2
            self.layer.borderColor = UIColor.lightGray.cgColor
        case .thin:
            self.layer.borderWidth = 0.7
            self.layer.borderColor = UIColor.lightGray.cgColor
        case .none:
            break
        }
    }
    
    private func addCorner() {
        if hasCorners {
            self.layer.cornerRadius = 2.5
        }
    }
}

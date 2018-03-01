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
    private var borderStyle: boxViewBorderStyle = .none
    private var hasCorners: Bool = false
    
    enum boxViewBorderStyle {
        case none, thin, heavy
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init (hasCorners: Bool, borderStyle: boxViewBorderStyle){
        self.init()
        self.borderStyle = borderStyle
        self.hasCorners = hasCorners
        setUpView()
    }
    
    //MARK:- Utilities
    private func setUpView() {
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        setBorderStyle()
        addCorner()
    }
    
    private func setBorderStyle() {
        switch borderStyle {
        case .heavy:
            self.layer.borderWidth = 2
        case .thin:
            self.layer.borderWidth = 0.5
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

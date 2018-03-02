//
//  ThemedButton.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/2/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class ThemedButton: UIButton, Themeable{
    var theme: Theme?
    
    required init(theme: Theme) {
        self.init()
        self.theme = theme
        setUpView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        disableAutoResizing()
        titleLabel?.font = UIFont.init(name: "OpenSans-SemiBold", size: 16)
        setColors()
        addCorners()
    }
    
    private func setColors() {
        setTitleColor(theme?.accentColor, for: .normal)
        backgroundColor = theme?.mainColor
    }
    
    private func addCorners() {
        layer.cornerRadius = 3
    }
}

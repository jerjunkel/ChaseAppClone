//
//  ThreeButtonStackView.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/2/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class ThreeButtonStackView: UIView {
    private var buttons: [ThemedButton] = []
    private var seperator: [UILabel] = []
    private var buttonTitles: [String]?
    var theme: Theme?
    
    
//    required init(theme: Theme) {
//        self.init()
//        self.theme = theme
//    }
    
    convenience init(theme: Theme, buttonTitles: [String]) {
        self.init()
        self.theme = theme
        self.buttonTitles = buttonTitles
        disableAutoResizing()
        createButtons()
        setContraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Utilities
    private func createButtons() {
        guard let buttonTitles = buttonTitles else { return }
        
        for title in buttonTitles {
            guard let theme = self.theme else { return }
            let button = ThemedButton(theme: theme)
            button.setTitle(title, for: .normal)
            buttons.append(button)
            addButtonToView(button: button)
        }
    }
    
    private func addButtonToView(button: ThemedButton) {
        addSubview(button)
    }
    
    private func setContraints() {
       // guard let buttons = buttons else { return }
        var previousTrailing = self.leadingAnchor
        
        for button in buttons {
            button.leadingAnchor.constraint(equalTo: previousTrailing).isActive = true
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            button.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            previousTrailing = button.trailingAnchor
        }
    }
    
    
    //Views
    private var separatorLabel1: UILabel = {
        let label = UILabel()
        label.disableAutoResizing()
        label.text = "|"
        return label
    }()
    
    private var separatorLabel2: UILabel = {
        let label = UILabel()
        label.disableAutoResizing()
        label.text = "|"
        return label
    }()
}



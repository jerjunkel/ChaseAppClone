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
            addToParent(view: button)
        }
    }
    
    private func addToParent(view: UIView) {
        addSubview(view)
    }
    
    private func setContraints() {
       // guard let buttons = buttons else { return }
        var previousTrailing = self.leadingAnchor
        
        for button in buttons {
            button.leadingAnchor.constraint(equalTo: previousTrailing, constant: 10).isActive = true
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            button.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            previousTrailing = button.trailingAnchor
            
            if button == buttons.last {
                button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
            }else{
                let separator = makeSeparatorLabel()
                addToParent(view: separator)
                separator.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 10).isActive = true
                separator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                separator.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                previousTrailing = separator.trailingAnchor
            }
        }
    }
    
    private func makeSeparatorLabel() -> UILabel {
        let label = UILabel()
        label.disableAutoResizing()
        label.text = "|"
        return label
    }
    
    //MARK: - Stack Utilities
    
    func setFont(to font: UIFont?) {
       _ = buttons.map { $0.titleLabel?.font = font}
    }
    
    func addTarget(button index: Int, action: Selector) {
        guard index >= 0 && index < buttons.count else { return }
        buttons[index].addTarget(nil, action: action, for: .touchUpInside)
    }
    
    func addTargets(actions: [Selector]) {
        guard actions.count == buttons.count else { return }
        for (index, action) in actions.enumerated() {
            addTarget(button: index, action: action)
        }
    }
    
    //MARK:- Views
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

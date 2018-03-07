//
//  LabelCheckBox.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/7/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class LabelCheckBox: UITextField {
    private enum CheckBoxState {
        case checked, notChecked
    }
    
    private var buttonState: CheckBoxState = .notChecked {
        didSet {
            updateButtonUI()
        }
    }
    
    convenience init(title: String) {
        self.init()
        label.text = title
        disableAutoResizing()
        addViews()
        setContraints()
        updateButtonUI()
    }
    
    //MARK: - Utilities
    private func addViews() {
        addSubview(label)
        addSubview(button)
    }
    
    private func setContraints() {
        
        _ = [label.leadingAnchor.constraint(equalTo: leadingAnchor),
             //label.trailingAnchor.constraint(equalTo: button.leadingAnchor),
            //            label.topAnchor.constraint(equalTo: topAnchor),
            //            label.bottomAnchor.constraint(equalTo: bottomAnchor)
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
            ].map{$0.isActive = true}
        
        _ = [button.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 5),
             button.trailingAnchor.constraint(equalTo: trailingAnchor),
             button.topAnchor.constraint(equalTo: topAnchor),
             button.bottomAnchor.constraint(equalTo: bottomAnchor),
             button.heightAnchor.constraint(equalToConstant: 15),
             button.widthAnchor.constraint(equalToConstant: 15)
            ].map{$0.isActive = true}
    }
    
    @objc private func changeButtonState() {
        switch buttonState {
        case .checked:
            buttonState = .notChecked
        case .notChecked:
            buttonState = .checked
        }
    }
    
    private func updateButtonUI() {
        switch buttonState {
        case .checked:
            button.setImage(UIImage(named: "tickblue"), for: .normal)
            button.layer.borderWidth = 0
        case .notChecked:
            button.setImage(nil, for: .normal)
            button.layer.borderWidth = 1
        }
    }
    
    //MARK: - Views
    private let button: UIButton = {
        let button = UIButton()
        button.disableAutoResizing()
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 2
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(nil, action: #selector(changeButtonState), for: .touchUpInside)
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.disableAutoResizing()
        label.font = UIFont(name: OpenSans.light.stringValue, size: 12)
        return label
    }()
}

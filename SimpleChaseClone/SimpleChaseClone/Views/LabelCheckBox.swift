//
//  LabelCheckBox.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/7/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class LabelCheckBox: UITextField {
    enum CheckBoxState {
        case checked, notChecked
    }
    
    convenience init(title: String) {
        self.init()
        label.text = title
        disableAutoResizing()
        addViews()
        setContraints()
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
    
    //MARK: - Views
    private let button: UIButton = {
        let button = UIButton()
        button.disableAutoResizing()
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 2
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.disableAutoResizing()
        label.font = UIFont(name: OpenSans.light.stringValue, size: 12)
        return label
    }()
}

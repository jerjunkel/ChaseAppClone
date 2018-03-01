//
//  UserLoginViewController.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/1/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {
    private var infoBoxView: BoxView = BoxView(hasCorners: false, borderStyle: .none)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    //MARK: - Utilities
    private func setUpViewController() {
        view.backgroundColor = .clear
        addSubViews()
        setContraints()
    }
    
    private func addSubViews() {
        view.addSubview(infoBoxView)
    }
    
    private func setContraints() {
        _ = [infoBoxView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
             infoBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             infoBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             infoBoxView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ].map{$0.isActive = true}
    }
    
}

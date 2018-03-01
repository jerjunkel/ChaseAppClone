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
        infoBoxView.addSubview(infoLabel)
    }
    
    private func setContraints() {
        _ = [infoBoxView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
             infoBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             infoBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             infoBoxView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ].map{$0.isActive = true}
        _ = [infoLabel.bottomAnchor.constraint(equalTo: infoBoxView.bottomAnchor),
            infoLabel.centerXAnchor.constraint(equalTo: infoBoxView.centerXAnchor)
            ].map{$0.isActive = true}
    }
    
    private var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.numberOfLines = 4
        label.font = UIFont(name: "OpenSans-Regular", size: 9)
        label.text = "Equal Housing Lender\nDeposit products provided by JPMorgan Chase Bank, N.A. Member FDIC\nCredit cards are issued by Chase Bank USA, N.A.\n© 2017 JPMorgan Chase & Co."
        label.disableAutoResizing()
        return label
    }()
}

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
    private var loginBoxView: BoxView = BoxView(hasCorners: true, borderStyle: .thin)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    //MARK:- Utilities
    private func setUpViewController() {
        view.backgroundColor = .clear
        addSubViews()
        setContraints()
    }
    
    private func addSubViews() {
        view.addSubview(infoBoxView)
        view.addSubview(loginBoxView)
        addInfoBoxSubViews()
        addLoginBoxSubViews()
    }
    
    private func setContraints() {
        _ = [infoBoxView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.265),
             infoBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             infoBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             infoBoxView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ].map{$0.isActive = true}
        
        _ = [loginBoxView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.32),
             loginBoxView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
             loginBoxView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             loginBoxView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -20)
            ].map{$0.isActive = true}
        
        setInfoBoxSubviewContraints()
        setLoginBoxSubViewContraints()
    }
    
    private func addLoginBoxSubViews() {
        loginBoxView.addSubview(recoverUserIdPasswordButton)
        loginBoxView.addSubview(loginButton)
    }
    
    private func setLoginBoxSubViewContraints() {
        _ = [recoverUserIdPasswordButton.bottomAnchor.constraint(equalTo: loginBoxView.bottomAnchor),
             recoverUserIdPasswordButton.centerXAnchor.constraint(equalTo: loginBoxView.centerXAnchor),
             recoverUserIdPasswordButton.widthAnchor.constraint(equalTo: loginBoxView.widthAnchor, multiplier: 0.9)
            ].map{$0.isActive = true}
        
        _ = [loginButton.bottomAnchor.constraint(equalTo: recoverUserIdPasswordButton.topAnchor),
             loginButton.centerXAnchor.constraint(equalTo: loginBoxView.centerXAnchor),
             loginButton.widthAnchor.constraint(equalTo: loginBoxView.widthAnchor, multiplier: 0.9)
            ].map{$0.isActive = true}
    }
    
    private func addInfoBoxSubViews() {
        infoBoxView.addSubview(infoLabel)
        infoBoxView.addSubview(buttonStack)
    }
    
    private func setInfoBoxSubviewContraints() {
        _ = [infoLabel.bottomAnchor.constraint(equalTo: infoBoxView.bottomAnchor),
             infoLabel.centerXAnchor.constraint(equalTo: infoBoxView.centerXAnchor)
            ].map{$0.isActive = true}
        
        _ = [buttonStack.bottomAnchor.constraint(equalTo: infoLabel.topAnchor),
             buttonStack.centerXAnchor.constraint(equalTo: infoLabel.centerXAnchor)
            ].map{$0.isActive = true}
    }
    
    //MARK:- Views
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
    
    private var recoverUserIdPasswordButton: ThemedButton = {
        let button = ThemedButton(theme: WhiteTheme())
        button.setTitle("Forgot User ID or Password?", for: .normal)
        return button
    }()
    
    private var loginButton: ThemedButton = {
        let button = ThemedButton(theme: BlueTheme())
        button.setTitle("Log On", for: .normal)
        return button
    }()
    
    private let buttonStack = ThreeButtonStackView(theme: WhiteTheme(), buttonTitles: ["Enroll","ATM & Branch","Contact"])
}

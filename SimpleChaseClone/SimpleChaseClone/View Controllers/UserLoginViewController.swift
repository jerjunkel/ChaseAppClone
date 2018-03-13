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
    
    override func viewDidAppear(_ animated: Bool) {
        authenticate()
        observeKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardNotifications()
    }
    
    //MARK:- Utilities
    private func setUpViewController() {
        view.backgroundColor = .clear
        addSubViews()
        setContraints()
        setTextFieldDelegate()
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
             loginBoxView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -10)
            ].map{$0.isActive = true}
        
        setInfoBoxSubviewContraints()
        setLoginBoxSubViewContraints()
    }
    
    private func addLoginBoxSubViews() {
        loginBoxView.addSubview(recoverUserIdPasswordButton)
        loginBoxView.addSubview(loginButton)
        loginBoxView.addSubview(userNameTextfield)
        loginBoxView.addSubview(userPasswordTextfield)
        loginBoxView.addSubview(rememberMeLabel)
        loginBoxView.addSubview(useTokenLabel)
    }
    
    private func setLoginBoxSubViewContraints() {
        _ = [recoverUserIdPasswordButton.bottomAnchor.constraint(equalTo: loginBoxView.bottomAnchor, constant: -10),
             recoverUserIdPasswordButton.centerXAnchor.constraint(equalTo: loginBoxView.centerXAnchor),
             recoverUserIdPasswordButton.widthAnchor.constraint(equalTo: loginBoxView.widthAnchor, multiplier: 0.9)
            ].map{$0.isActive = true}
        
        _ = [loginButton.bottomAnchor.constraint(equalTo: recoverUserIdPasswordButton.topAnchor),
             loginButton.centerXAnchor.constraint(equalTo: loginBoxView.centerXAnchor),
             loginButton.widthAnchor.constraint(equalTo: loginBoxView.widthAnchor, multiplier: 0.9)
            ].map{$0.isActive = true}
        
        _ = [userNameTextfield.centerXAnchor.constraint(equalTo: loginBoxView.centerXAnchor),
             userNameTextfield.widthAnchor.constraint(equalTo: loginBoxView.widthAnchor, multiplier: 0.9),
             userNameTextfield.topAnchor.constraint(equalTo: loginBoxView.topAnchor, constant: 10)
            ].map{$0.isActive = true}
        
        _ = [userPasswordTextfield.centerXAnchor.constraint(equalTo: loginBoxView.centerXAnchor),
             userPasswordTextfield.widthAnchor.constraint(equalTo: loginBoxView.widthAnchor, multiplier: 0.9),
             userPasswordTextfield.topAnchor.constraint(equalTo: userNameTextfield.bottomAnchor, constant: 20)
            ].map{$0.isActive = true}
        
        _ = [rememberMeLabel.leadingAnchor.constraint(equalTo: userPasswordTextfield.leadingAnchor),
             rememberMeLabel.topAnchor.constraint(equalTo: userPasswordTextfield.bottomAnchor, constant: 20)
            ].map {$0.isActive = true}
        
        _ = [useTokenLabel.trailingAnchor.constraint(equalTo: userPasswordTextfield.trailingAnchor),
             useTokenLabel.topAnchor.constraint(equalTo: userPasswordTextfield.bottomAnchor, constant: 20)
            ].map{$0.isActive = true}
    }
    
    private func addInfoBoxSubViews() {
        infoBoxView.addSubview(infoLabel)
        infoBoxView.addSubview(loginMoreActionButtonStack)
        infoBoxView.addSubview(moreInfoButtonStack)
    }
    
    private func setInfoBoxSubviewContraints() {
        _ = [infoLabel.bottomAnchor.constraint(equalTo: infoBoxView.bottomAnchor),
             infoLabel.centerXAnchor.constraint(equalTo: infoBoxView.centerXAnchor)
            ].map{$0.isActive = true}
        
        _ = [loginMoreActionButtonStack.topAnchor.constraint(equalTo: loginBoxView.bottomAnchor, constant: 10),
             loginMoreActionButtonStack.centerXAnchor.constraint(equalTo: infoLabel.centerXAnchor)
            ].map{$0.isActive = true}
        
        _ = [moreInfoButtonStack.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -10),
             moreInfoButtonStack.centerXAnchor.constraint(equalTo: infoLabel.centerXAnchor)
            ].map{$0.isActive = true}
    }
    
    @objc private func buttonPressed(button: UIButton) {
        print("\(button.titleLabel?.text ?? "") Button pressed" )
    }
    
    private func setTextFieldDelegate() {
        userNameTextfield.textfieldDelegate = self
        userPasswordTextfield.textfieldDelegate = self
    }
    
    //MARK:- Keyboard Utilities
    private func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: .UIKeyboardDidHide, object: nil)
    }
    
    private func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidHide, object: nil)
    }
    
    @objc func handleKeyboard(sender: Notification) {
        animateLoginBoxView(notification: sender.name)
    }
    
    //MARK:- Animatition Utilities
    private func animateLoginBoxView(notification: Notification.Name) {
        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut)
        
        switch notification {
        case .UIKeyboardDidShow:
            animator.addAnimations {
                self.loginBoxView.transform = CGAffineTransform(translationX: 0, y: -100)
            }
        case .UIKeyboardDidHide:
            animator.addAnimations {
                self.loginBoxView.transform = CGAffineTransform.identity
            }
        default:
            break
        }
        
        animator.startAnimation()
    }
    
    //MARK: - User Authentication Utilities
    @objc private func authenticate() {
        Authenticator.manager.authenticate()
    }
    
    //MARK:- Views
    private var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.numberOfLines = 4
        label.font = UIFont(name: OpenSans.regular.stringValue, size: 9)
        label.text = "Equal Housing Lender\nDeposit products provided by JPMorgan Chase Bank, N.A. Member FDIC\nCredit cards are issued by Chase Bank USA, N.A.\n© 2017 JPMorgan Chase & Co."
        label.disableAutoResizing()
        return label
    }()
    
    private var recoverUserIdPasswordButton: ThemedButton = {
        let button = ThemedButton(theme: WhiteTheme())
        button.setTitle("Forgot User ID or Password?", for: .normal)
        button.titleLabel?.font = UIFont(name: OpenSans.semiBold.stringValue, size: 14)
        return button
    }()
    
    private var loginButton: ThemedButton = {
        let button = ThemedButton(theme: BlueTheme())
        button.setTitle("Log On", for: .normal)
        return button
    }()
    
    private let loginMoreActionButtonStack: ThreeButtonStackView = {
        let stack = ThreeButtonStackView(theme: WhiteTheme(), buttonTitles: ["Enroll","ATM & Branch","Contact"])
        stack.setFont(to: UIFont.init(name: OpenSans.regular.stringValue, size: 15))
        stack.addTarget(button: 0, action: #selector(buttonPressed(button:)))
        stack.addTarget(button: 1, action: #selector(buttonPressed(button:)))
        stack.addTarget(button: 2, action: #selector(buttonPressed(button:)))
        return stack
    }()
    
    private let moreInfoButtonStack: ThreeButtonStackView = {
        let stack = ThreeButtonStackView(theme: WhiteTheme(), buttonTitles: ["FAQs","Privacy","Info"])
        stack.setFont(to: UIFont.init(name: OpenSans.regular.stringValue, size: 13))
        return stack
    }()
    
    private let userNameTextfield: CustomTextfieldView = {
        let textfieldView = CustomTextfieldView(placeHolder: "Enter Your User Name", type: .textfieldOnly)
        return textfieldView
    }()
    
    private let userPasswordTextfield: CustomTextfieldView = {
        let textfieldView = CustomTextfieldView(placeHolder: "Enter Your User Password", type: .hasImage)
        textfieldView.image = UIImage(named: "finger_print_iconblue")
        textfieldView.addTarget(selector: #selector(authenticate))
        return textfieldView
    }()
    
    private let rememberMeLabel: LabelCheckBox = {
        let label = LabelCheckBox(title: "Remember me")
        return label
    }()
    
    private let useTokenLabel: LabelCheckBox = {
        let label = LabelCheckBox(title: "Use token")
        return label
    }()
}

//MARK:- Textfield Delegate Methods
extension UserLoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

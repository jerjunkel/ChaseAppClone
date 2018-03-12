//
//  Authenticator.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/8/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import Foundation
import LocalAuthentication

protocol UserAuthenticationObserver: class {
    func userAuthenticationStatusChange(to status: UserAuthenticationState)
}

protocol UserAuthenticator {
    var userLoginStatus: UserAuthenticationState { get set }
    func authenticate()
    func addObserver(observer: UserAuthenticationObserver)
}

enum UserAuthenticationState {
    case error(error: Error)
    case success, loggedOut
}

class Authenticator: UserAuthenticator {
    static let manager = Authenticator()
    var userLoginStatus: UserAuthenticationState = .loggedOut {
        didSet {
            handleAuthenticationStateChange()
        }
    }
    private var authenticatorContext: LAContext = LAContext()
    private var observer: UserAuthenticationObserver?
    private var authError: NSError?
    
    private init(){}
    
    func authenticate() {
        if case .loggedOut = userLoginStatus {
            if authenticatorContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError){
                authenticatorContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Login to View Accounts", reply: { (success, error) in
                    
                    if success {
                        self.userLoginStatus = .success
                        self.observer?.userAuthenticationStatusChange(to: .success)
                    }else {
                        //self.userLoginStatus = .loggedOut
                        self.observer?.userAuthenticationStatusChange(to: .error(error: error!))
                    }
                })
            }
        }
    }
    
    
    func addObserver(observer: UserAuthenticationObserver) {
        self.observer = observer
    }
    
    private func handleAuthenticationStateChange() {
        switch userLoginStatus {
        case .loggedOut:
            print("Logged out")
        case .success:
            print("logged in")
        case .error(error: let error):
            print(error.localizedDescription)
        }
    }
}

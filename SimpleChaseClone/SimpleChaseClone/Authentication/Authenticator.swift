//
//  Authenticator.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/8/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import Foundation
import LocalAuthentication

class Authenticator {
    static let manager = Authenticator()
    private init(){}
    
    private var localAuthContext = LAContext()
    var status: Bool = false
    var authError: NSError?
    
    @objc func authenticateUser() {
        if localAuthContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError){
            localAuthContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Login to View Accounts", reply: { (success, error) in
                
                if success {
                    print("Success")
                    self.status = success
                    
                }else {
                    print(error!.localizedDescription)
                }
            })
        } else {
          print(authError?.localizedDescription)
        }
    }
}

protocol UserAuthenticationObserver: class {
    func userAuthenticationStatusChange(to status: UserAuthenticationStatus)
}

protocol UserAuthenticator: UserAuthenticationObserver {
    var userLoginSuccess: Bool { get set }
    var authenticatorContext: LAContext { get }
    func authenticate()
}

enum UserAuthenticationStatus {
    case error(error: Error)
    case success
}

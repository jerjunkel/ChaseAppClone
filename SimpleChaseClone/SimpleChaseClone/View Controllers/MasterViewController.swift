//
//  UserLoginViewController.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/1/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    private let loginVC = UserLoginViewController()
    private var userHomeVC: SlideContainterViewController?
    //private let loadingVC = LoadingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        //authenticateUser()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Authenticator.manager.addObserver(observer: self)
        animateViews()
    }
    
    //MARK:- Utilities
    private func setUpViewController() {
        view.backgroundColor = ChaseColor.blue.color
        addSubViews()
        setContraints()
        addLoginViewController()
        stageAnimation()
    }
    
    private func addSubViews() {
        view.addSubview(backgroundImage)
        view.addSubview(logoImageView)
    }
    
    private func setContraints() {
        _ = [backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
             backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor)
            ].map{$0.isActive = true}
        
        _ = [logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
             logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ].map{$0.isActive = true}
    }
    
    private func addLoginViewController() {
        addChildViewController(loginVC)
        view.addSubview(loginVC.view)
        loginVC.didMove(toParentViewController: self)
    }
    
    private func authenticateUser() {
        Authenticator.manager.authenticate()
    }
    
    private func showUserAccountHome() {
        DispatchQueue.main.async {
            self.userHomeVC = SlideContainterViewController(mainViewController: AccountHomeViewController(), sidePanelViewController: AccountSlideMenuViewController())
            //self.navigationController?.pushViewController(self.userHomeVC!, animated: true)
            self.present(self.userHomeVC!, animated: true, completion: nil)
        }
    }
    
    //MARK:- Animation Utilities
    private func animateViews() {
        let animator = UIViewPropertyAnimator(duration: 1, curve: .easeOut)
        loginVC.animateViews()
        animator.addAnimations {
            self.backgroundImage.alpha = 1
            self.logoImageView.alpha = 1
            self.logoImageView.transform = CGAffineTransform.identity
            self.backgroundImage.transform = CGAffineTransform.identity
        }
        
        animator.startAnimation()
    }
    
    private func stageAnimation() {
        backgroundImage.alpha = 0
        logoImageView.alpha = 0
        logoImageView.transform = CGAffineTransform(translationX: 0, y: 300)
        backgroundImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }
    
    //MARK:- LoadingVC Utilities
    private func showLoadingScreen() {
        DispatchQueue.main.async {
            let loadingScreen = LoadingViewController()
            loadingScreen.modalTransitionStyle = .crossDissolve
            loadingScreen.modalPresentationStyle = .overCurrentContext
            self.present(loadingScreen, animated: true, completion: nil)
        }
    }
    
    //MARK: Views
    private var backgroundImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.image = UIImage(named: "background1")
        imageView.contentMode = .scaleAspectFill
        imageView.disableAutoResizing()
        return imageView
    }()
    
    private var logoImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: "chase-logo-white-small")
        imageView.disableAutoResizing()
        return imageView
    }()
}

//MARK:- UserAuthenticationObserver Delegate method
extension MasterViewController: UserAuthenticationObserver {
    func userAuthenticationStatusChanged(to status: UserAuthenticationState) {
        switch status {
        case .success:
            //print("Logged In")
            //showLoadingScreen()
            showUserAccountHome()
        case .loggedOut:
            print("Logged Out")
        case .error(error: let error):
            print(error!.localizedDescription)
        }
    }
}

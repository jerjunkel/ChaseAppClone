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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }

    //MARK:- Utilities
    private func setUpViewController() {
        view.backgroundColor = ChaseColor.blue.color
        addSubViews()
        setContraints()
        addLoginViewController()
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

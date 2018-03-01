//
//  UserLoginViewController.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/1/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }

    //MARK:- Utilities
    private func setUpViewController() {
        view.backgroundColor = Colors.blue.color
        addSubViews()
        setContraints()
    }
    
    private func addSubViews() {
        view.addSubview(backgroundImage)
       // view.addSubview(infoBoxView)
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
        
//        _ = [infoBoxView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
//            infoBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            infoBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            infoBoxView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            ].map{$0.isActive = true}
    }
    
    //MARK: Views
    private var backgroundImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.image = UIImage(named: "background2")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var logoImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: "chase-logo-white-small")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //private var infoBoxView: BoxView = BoxView(hasCorners: false, borderStyle: .none)
}

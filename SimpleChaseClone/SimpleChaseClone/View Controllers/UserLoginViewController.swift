//
//  UserLoginViewController.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/1/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {

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
        view.addSubview(infoBoxView)
    }
    
    private func setContraints() {
        _ = [backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 0.7)
            ].map{$0.isActive = true}
        
        _ = [infoBoxView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor),
            infoBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoBoxView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ].map{$0.isActive = true}
    }
    
    //MARK: Views
    private var backgroundImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var infoBoxView: BoxView = BoxView(with: true, borderStyle: .heavy)
}

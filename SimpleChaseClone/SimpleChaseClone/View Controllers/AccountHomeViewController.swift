//
//  AccountHomeViewController.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/21/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class AccountHomeViewController: UIViewController, SlidableViewController {
    var delegate: CenterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViewController()
    }

    private func setupViewController() {
        view.backgroundColor = .white
        setupNavigationController()
        addSubViews()
        setContraints()
    }
    
    private func setupNavigationController() {
      navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Slide", style: .done, target: self, action: #selector(handleSlideButton))
    }
    
    private func addSubViews() {
        view.addSubview(backgroundImageView)
    }
    
    private func setContraints() {
        _ = [backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ].map{$0.isActive = true}
    }
    
    @objc private func handleSlideButton () {
        delegate?.toggleSlide()
    }
    
    private let backgroundImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.disableAutoResizing()
        imageview.image = UIImage(named: "background3")
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
}

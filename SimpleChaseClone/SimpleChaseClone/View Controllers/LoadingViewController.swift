//
//  LoadingViewController.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/14/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        view.backgroundColor = .purple
    }

    //MARK:- Utilities
    private func setUpViewController() {
        view.backgroundColor = .clear
        addViews()
        setConstraints()
    }

    private func addViews() {
       view.addSubview(containerView)
    }

    private func setConstraints() {
        _ = [containerView.topAnchor.constraint(equalTo: view.topAnchor),
             containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ].map{$0.isActive = true}
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
    }

    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.5
        view.disableAutoResizing()
        return view
    }()
}

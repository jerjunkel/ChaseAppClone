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
        view.backgroundColor = .cyan
        setupNavigationController()
    }
    
    private func setupNavigationController() {
      navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Slide", style: .done, target: self, action: #selector(handleSlideButton))
    }
    
    @objc private func handleSlideButton () {
        delegate?.toggleSlide()
    }
}

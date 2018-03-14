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
    }
    //MARK:- Utilities
    
    private func setUpViewController() {
        view.backgroundColor = .white
        view.alpha = 0.5
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

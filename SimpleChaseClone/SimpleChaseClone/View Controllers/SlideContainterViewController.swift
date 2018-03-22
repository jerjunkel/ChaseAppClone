//
//  SlideContainterViewController.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/21/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class SlideContainterViewController: UIViewController {
    enum ControllerSlideState {
        case expanded, collapsed
    }
    private var state: ControllerSlideState = .collapsed
    private var centerViewController: UIViewController?
    private var leftViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    convenience init(centerVC: UIViewController, leftVC: UIViewController) {
        self.init()
        centerViewController = centerVC
        leftViewController = leftVC
    }
    
    private func setUpViewController() {
        view.backgroundColor = .red
    }
    
    //MARK:- Utilities
    private func addCenterVCToParent() {
        guard let centerVC = centerViewController else { return }
        view.addSubview(centerVC.view)
        addChildViewController(centerVC)
        centerVC.didMove(toParentViewController: self)
    }
}

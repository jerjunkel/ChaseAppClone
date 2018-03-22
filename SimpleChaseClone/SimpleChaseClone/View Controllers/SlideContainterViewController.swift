//
//  SlideContainterViewController.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/21/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit
protocol CenterViewControllerDelegate: class {
    func toggleSlide()
}
protocol Slidable: class {
    var delegate: CenterViewControllerDelegate? { get set }
}

class SlideContainterViewController: UIViewController {
    enum ControllerSlideState {
        case expanded, collapsed
    }
    private var state: ControllerSlideState = .collapsed
    private var centerViewController: AccountHomeViewController?
    private var leftViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    convenience init(centerVC: AccountHomeViewController, leftVC: UIViewController) {
        self.init()
        centerViewController = centerVC
       // leftViewController = leftVC
        
        setupViewController()
    }
    
    //MARK:- Utilities
    private func setupViewController() {
        view.backgroundColor = .clear
        addCenterVCToParent()
    }
    
    private func addCenterVCToParent() {
        guard let centerVC = centerViewController else { return }
        centerVC.delegate = self
        let newCenterVC = addNavigationController(to: centerVC)
        view.addSubview(newCenterVC.view)
        addChildViewController(newCenterVC)
        newCenterVC.didMove(toParentViewController: self)
    }
    
    private func addNavigationController(to viewController: UIViewController) -> UIViewController {
        let navVC = UINavigationController(rootViewController: viewController)
        return navVC
    }
}

extension SlideContainterViewController: CenterViewControllerDelegate {
    func toggleSlide() {
        print("Slide")
    }
}

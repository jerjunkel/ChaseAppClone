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
    private var currentState: ControllerSlideState = .collapsed
    private var centerViewController: AccountHomeViewController?
    private var leftViewController: UIViewController?
    private var centerNavigation: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    convenience init(centerVC: AccountHomeViewController, leftVC: UIViewController) {
        self.init()
        centerViewController = centerVC
        leftViewController = leftVC
        
        setupViewController()
    }
    
    //MARK:- Utilities
    private func setupViewController() {
        view.backgroundColor = .clear
        addCenterVCToParent()
        addSidePanelVC()
    }
    
    private func addCenterVCToParent() {
        guard let centerVC = centerViewController else { return }
        centerVC.delegate = self
        centerNavigation = UINavigationController(rootViewController: centerVC)
        view.addSubview(centerNavigation!.view)
        addChildViewController(centerNavigation!)
        centerNavigation!.didMove(toParentViewController: self)
    }

    private func addSidePanelVC() {
        guard let leftVc = leftViewController else { return }
        view.insertSubview(leftVc.view, at: 0)
        addChildViewController(leftVc)
        leftVc.didMove(toParentViewController: self)
    }
    
    //MARK:- Animation Utilities
    private func animateViewController() {
        let animator: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.8)
        
        switch currentState {
        case .collapsed:
            animator.addAnimations {
                self.centerNavigation?.view.frame.origin.x = self.view.center.x + 50
            }
            currentState = .expanded
        case .expanded:
            animator.addAnimations {
                self.centerNavigation?.view.frame.origin.x = 0
            }
            currentState = .collapsed
        }
        
        animator.startAnimation()
    }
    
    private func addShadow() {
        switch currentState {
        case .collapsed:
            centerNavigation?.view.layer.shadowOpacity = 0.0
        case .expanded:
            centerNavigation?.view.layer.shadowOpacity = 0.8
            centerNavigation?.view.layer.shadowRadius = 3
        }
    }
}

extension SlideContainterViewController: CenterViewControllerDelegate {
    func toggleSlide() {
        animateViewController()
        addShadow()
    }
}

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
protocol SlidableViewController: class {
    var delegate: CenterViewControllerDelegate? { get set }
}

class SlideContainterViewController: UIViewController {
    enum ControllerSlideState {
        case expanded, collapsed
    }
    private var currentState: ControllerSlideState = .collapsed
    private var mainViewController: SlidableViewController?
    private var sidePanelViewController: UIViewController?
    private var centerNavigationController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    convenience init(mainViewController: SlidableViewController, sidePanelViewController: UIViewController) {
        self.init()
        self.mainViewController = mainViewController
        self.sidePanelViewController = sidePanelViewController
        
        setupViewController()
    }
    
    //MARK:- Utilities
    private func setupViewController() {
        view.backgroundColor = .clear
        addMainViewControllerToParent()
        addSidePanelViewControllerToParent()
    }
    
    private func addMainViewControllerToParent() {
        guard let mainViewController = mainViewController else { return }
        mainViewController.delegate = self
        guard let centerViewController = mainViewController as? UIViewController else { return }
        centerNavigationController = UINavigationController(rootViewController: centerViewController)
        view.addSubview(centerNavigationController!.view)
        addChildViewController(centerNavigationController!)
        centerNavigationController!.didMove(toParentViewController: self)
    }

    private func addSidePanelViewControllerToParent() {
        guard let leftViewController = sidePanelViewController else { return }
        view.insertSubview(leftViewController.view, at: 0)
        addChildViewController(leftViewController)
        leftViewController.didMove(toParentViewController: self)
    }
    
    //MARK:- Animation Utilities
    private func animateViewController() {
        let animator: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.8)
        
        switch currentState {
        case .collapsed:
            animator.addAnimations {
                self.centerNavigationController?.view.frame.origin.x = self.view.center.x + 50
            }
            currentState = .expanded
        case .expanded:
            animator.addAnimations {
                self.centerNavigationController?.view.frame.origin.x = 0
            }
            currentState = .collapsed
        }
        
        animator.startAnimation()
    }
    
    private func addShadow() {
        switch currentState {
        case .collapsed:
            centerNavigationController?.view.layer.shadowOpacity = 0.0
        case .expanded:
            centerNavigationController?.view.layer.shadowOpacity = 0.8
            centerNavigationController?.view.layer.shadowRadius = 3
        }
    }
}

extension SlideContainterViewController: CenterViewControllerDelegate {
    func toggleSlide() {
        animateViewController()
        addShadow()
    }
}

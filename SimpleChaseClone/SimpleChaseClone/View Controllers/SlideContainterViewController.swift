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
        addSwipeGesture()
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
    
    private func addSwipeGesture() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        centerNavigationController?.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    //MARK:- Animation Utilities
    private func animateViewController() {
        let animator: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.7)
        
        switch currentState {
        case .collapsed:
            animator.addAnimations {
                self.centerNavigationController?.view.frame.origin.x = self.view.center.x + 50
            }
            addShadow(true)
            currentState = .expanded
        case .expanded:
            animator.addAnimations {
                self.centerNavigationController?.view.frame.origin.x = 0
            }
            animator.addCompletion({ (position) in
                if position == .end {
                    self.addShadow(false)
                }
            })
            currentState = .collapsed
        }
        
        animator.startAnimation()
    }
    
    private func addShadow(_ shouldShowShadow: Bool) {
        if shouldShowShadow {
            centerNavigationController?.view.layer.shadowOpacity = 0.8
        }else {
            centerNavigationController?.view.layer.shadowOpacity = 0.0
        }
    }
}

//MARK:- CenterViewControllerDelegate Method
extension SlideContainterViewController: CenterViewControllerDelegate {
    func toggleSlide() {
        animateViewController()
    }
}

//MARK:- UIGestureRecognizerDelegate Methods
extension SlideContainterViewController: UIGestureRecognizerDelegate {
    @objc private func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        guard let recognizerView = recognizer.view else { return }
        let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: view).x > 0)
        
        switch recognizer.state {
        case .began:
            addShadow(true)
        case .changed:
            if gestureIsDraggingFromLeftToRight {
                recognizerView.center.x = recognizerView.center.x + recognizer.translation(in: view).x
                recognizer.setTranslation(CGPoint.zero, in: view)
            }else {
                guard currentState != .collapsed && recognizerView.frame.maxX >= view.frame.maxX else { return }
                recognizerView.center.x = recognizerView.center.x + recognizer.translation(in: view).x
                recognizer.setTranslation(CGPoint.zero, in: view)
            }
        case .ended:
            let hasMovedGreaterThanHalfway = recognizerView.center.x > view.bounds.size.width
            if hasMovedGreaterThanHalfway {
                currentState = .collapsed
                animateViewController()
            }else {
                currentState = .expanded
                animateViewController()
            }
        default:
            break
        }
    }
}

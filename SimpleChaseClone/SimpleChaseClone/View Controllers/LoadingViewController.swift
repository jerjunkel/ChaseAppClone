//
//  LoadingViewController.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/14/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    private let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        drawCircle()
        addAnimationCircle()
    }

    //MARK:- Utilities
    private func setUpViewController() {
        view.backgroundColor = .clear
        addViews()
        setConstraints()
    }

    private func addViews() {
       view.addSubview(containerView)
        view.addSubview(loadingView)
    }

    private func setConstraints() {
        _ = [containerView.topAnchor.constraint(equalTo: view.topAnchor),
             containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ].map{$0.isActive = true}
        
        _ = [loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ].map {$0.isActive = true}
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    private func drawCircle() {
        let path = UIBezierPath(arcCenter: loadingView.center, radius: 15, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = ChaseColor.blue.color.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound //Makes line stroke round
        shapeLayer.strokeEnd = 0.5
        shapeLayer.strokeStart = 0
        shapeLayer.anchorPoint = loadingView.center
        
        loadingView.layer.addSublayer(shapeLayer)
    }
    
    private func addAnimationCircle() {
        let animator = UIViewPropertyAnimator(duration: 1, curve: .linear)
        let circleStrokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        let circleStrokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        let circleRotation = CAKeyframeAnimation(keyPath: "transform.rotation")
        let animationGroup = CAAnimationGroup()
        
        circleStrokeEndAnimation.fromValue = 0
        circleStrokeEndAnimation.toValue = 1
        //circleStrokeEndAnimation.repeatCount = MAXFLOAT
        circleStrokeEndAnimation.duration = 2
        circleStrokeEndAnimation.fillMode = kCAFillModeBackwards
        //circleStrokeEndAnimation.isRemovedOnCompletion = false
       
//        circleRotation.toValue = 30
//        circleRotation.fromValue = 0
        circleRotation.duration = 5
        circleRotation.values = [0,30,50,70]
        //circleRotation.keyTimes = [0,0.2,1]
        circleRotation.repeatCount = MAXFLOAT
        circleRotation.isRemovedOnCompletion = false
        circleRotation.fillMode = kCAFillModeForwards
        
        
        circleStrokeStartAnimation.fromValue = 0.2
        circleStrokeStartAnimation.toValue = 1
        circleStrokeStartAnimation.beginTime = 0.5
       // circleStrokeStartAnimation.repeatCount = MAXFLOAT
        circleStrokeStartAnimation.duration = 1.5
        circleStrokeStartAnimation.fillMode = kCAFillModeBackwards
        //circleStrokeStartAnimation.isRemovedOnCompletion = false
//
        animationGroup.animations = [circleRotation]
        animationGroup.duration = 5
        animationGroup.repeatCount = MAXFLOAT
        animationGroup.isRemovedOnCompletion = false
        animationGroup.fillMode = kCAFillModeForwards
        
        shapeLayer.add(animationGroup, forKey: "transfrom.rotation")

//        animator.addAnimations {
//            self.loadingView.layer.transform = CATransform3DMakeRotation(0, 0, 0, 1)
//        }
//
//       animator.startAnimation()
    }

    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.5
        view.disableAutoResizing()
        return view
    }()
    
    private let loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.disableAutoResizing()
        view.heightAnchor.constraint(equalToConstant: 15).isActive = true
        view.widthAnchor.constraint(equalToConstant: 15).isActive = true
        return view
    }()
}

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
    }
    
    convenience init(centerVC: UIViewController, leftVC: UIViewController) {
        self.init()
        centerViewController = centerVC
        leftViewController = leftVC
    }
}

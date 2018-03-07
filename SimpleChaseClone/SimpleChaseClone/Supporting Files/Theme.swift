//
//  Theme.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/4/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import Foundation
import UIKit

//enum Theme {
//    case blue, white, gray, none
//}

protocol Theme {
    var accentColor: UIColor {get}
    var mainColor: UIColor {get}
}

protocol Themeable {
    var theme: Theme? { get }
    init(theme: Theme)
}

struct BlueTheme: Theme {
    var accentColor: UIColor = .white
    var mainColor: UIColor = ChaseColor.blue.color
}

struct WhiteTheme: Theme {
    var accentColor: UIColor = ChaseColor.blue.color
    var mainColor: UIColor = .white
}

enum OpenSans: String {
    case light = "OpenSans-Light"
    case semiBold = "OpenSans-SemiBold"
    case regular = "OpenSans-Regular"
    case bold = "OpenSans-Bold"
    
    var stringValue: String {
        return self.rawValue
    }
}

//
//  ColorManager.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/1/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import Foundation
import UIKit

enum Colors: String {
    case blue = "117ACA"
    case gray = "000000"
    
    var color: UIColor {
        return UIColor.makeColorFromHex(value: self.rawValue)
    }
}

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
    var mainColor: UIColor = Colors.blue.color
}

struct WhiteTheme: Theme {
    var accentColor: UIColor = Colors.blue.color
    var mainColor: UIColor = .white
}

extension UIColor {
    static func makeColorFromHex(value: String) -> UIColor {
        var cString:String = value.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

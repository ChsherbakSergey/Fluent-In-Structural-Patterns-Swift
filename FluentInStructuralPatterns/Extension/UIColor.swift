//
//  UIColor.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/11/21.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat? = 1.0) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }
    
    static var twitterSolid = UIColor { (collection) -> UIColor in
        if collection.userInterfaceStyle == .dark {
            return UIColor.rgb(red: 28.0, green: 160.0, blue: 242.0)
        } else {
            return UIColor.rgb(red: 28.0, green: 160.0, blue: 242.0)
        }
    }
}

//
//  UIColor+Ext.swift
//  RandomColor
//
//  Created by Khant Phone Naing  on 16/10/2024.
//

import Foundation
import UIKit

extension UIColor {
    static func random() -> UIColor {
        let random = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
        )
        
        return random
    }
    
    func toHexString() -> String? {
        
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            let hex = String(
                format: "#%02X%02X%02X",
                Int(r * 255),
                Int(g * 255),
                Int(b * 255)
            )
            return hex
        }
        
        return nil
    }
}

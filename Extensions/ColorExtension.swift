//
//  ColorExtension.swift
//  ktp-hackathon (iOS)
//
//  Created by Beliz Yılmaz on 3/26/22.
//

import SwiftUI

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

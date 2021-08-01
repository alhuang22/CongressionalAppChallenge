//
//  CollegeStyling.swift
//  test101
//
//  Created by Jonathan Chi on 7/31/21.
//

import Foundation
import UIKit

extension Style {
    static var myApp: Style {
        return Style(
            backgroundColor: .black,
            preferredStatusBarStyle: .lightContent,
            attributesForStyle: { $0.myAppAttributes }
        )
    }
}

private extension Style.TextStyle {
    var myAppAttributes: Style.TextAttributes {
        switch self {
        case .title:
            return Style.TextAttributes(font: .myAppTitle, color: .black)
        case .subtitle:
            return Style.TextAttributes(font: .myAppSubtitle, color: .black)
        case .subsubtitle:
            return Style.TextAttributes(font: .myAppSubSubtitle, color: .black)
        case .information:
            return Style.TextAttributes(font: .myAppInformation, color: .black)
        }
    }
}


extension UIFont {
    static var myAppTitle: UIFont {
        return UIFont.systemFont(ofSize: 28)
    }
    static var myAppSubtitle: UIFont {
        return UIFont.systemFont(ofSize: 20)
    }
    
    static var myAppSubSubtitle: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    static var myAppInformation: UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
}

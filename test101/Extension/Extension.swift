//
//  Extension.swift
//  test101
//
//  Created by Jonathan Chi on 8/1/21.
//

import Foundation
import UIKit

enum table_identifier{
    case popular_majors
    case highest_earning_majors
    
    var converted : String{
        switch self{
            case .popular_majors : return "popular_major"
        case .highest_earning_majors : return "highest_earning_major"
        }
    }
}

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height + 1
    }
}

extension NSMutableAttributedString {

    public func setAsLink(textToFind:String, linkURL:String) -> Bool {

        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(.link, value: linkURL, range: foundRange)
            return true
        }
        return false
    }
}

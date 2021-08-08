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

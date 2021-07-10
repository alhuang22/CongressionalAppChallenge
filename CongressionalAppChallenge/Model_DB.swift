//
//  Model_DB.swift
//  CongressionalAppChallenge
//
//  Created by Alex Huang on 7/8/21.
//

import Foundation
import UIKit

class Model_DB : Codable {
    let college_name : String
    let college_image : String
    let acc_rate : Double
    
    init(c_name : String, c_image : String, a_rate : Double) {
        self.college_name = c_name
        self.college_image = c_image
        self.acc_rate = a_rate
    }
}

//
//  Model_Database.swift
//  test101
//
//  Created by Jonathan Chi on 7/8/21.
//

import Foundation
import UIKit

class Model_Database : Codable {
    let c_name : String
    let c_image : String
    let ac_rate : Double
    
    
    init(c_name : String, c_image : String, ac_rate : Double){
        self.c_name = c_name
        self.c_image = c_image
        self.ac_rate = ac_rate
    }
    
}

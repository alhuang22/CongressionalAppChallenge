//
//  Model_Database.swift
//  test101
//
//  Created by Jonathan Chi on 7/8/21.
//

import Foundation
import UIKit

class Model_DB : Codable {
    let c_name : String
    let c_image : String
    let acc_rate : Double
    let contact_number : String
    
   
    
    init(c_name : String, c_image : String, acc_rate : Double, contact_number : String){
        self.c_name = c_name
        self.c_image = c_image
        self.acc_rate = acc_rate
        self.contact_number = contact_number
    }
    
}

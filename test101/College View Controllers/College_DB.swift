//
//  College_DB.swift
//  test101
//
//  Created by Jonathan Chi on 7/21/21.
//

import Foundation
import UIKit


public struct College : Codable {
    //initialize the let declration properties when we declare the instance
    let college_name : String
    let address : String
    let city : String
    let state : String
    
    // we do not have the initiliaze delcration we we declare the instance ? meaning
    var domain : String?
    var graduation_rate : Int?
    var percent_admitted : Int?
    var tuition : Int?
    var percent_financial_aid : Int?
    var SAT_W_75_Percentile : Int?
    var SAT_M_75_Percentile : Int?
    var ACT_25_Percentile : Int?
    var ACT_75_Percentile : Int?
    var application_total : Int?
    var total_enrollment : Int?

}

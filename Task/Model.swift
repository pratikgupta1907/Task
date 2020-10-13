//
//  Model.swift
//  Task
//
//  Created by pratik gupta on 13/10/20.
//

import Foundation
import SwiftyJSON

struct Model {
    
    var image: String = ""
    var totalPrize: String?
    var totalParticipant: String?
    var startDate: String?
    var team: String?

    
    init() {
        
    }
    
    init(json: JSON) {
        
        image = json["image"].stringValue
        totalPrize = json["totalPrize"].stringValue
        totalParticipant = json["totalParticipant"].stringValue
        startDate = json["startDate"].stringValue
        team = json["team"].stringValue

    }
    
}

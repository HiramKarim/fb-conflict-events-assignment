//
//  EventModel.swift
//  EventsApp
//
//  Created by Hiram Castro on 21/08/21.
//

import Foundation

class EventModel:Decodable {
    
    let eventTitle:String
    let eventStartDate:String
    let eventEndDate:String
    
    enum CodingKeys: String, CodingKey {
        case eventTitle = "title"
        case eventStartDate = "start"
        case eventEndDate = "end"
    }
    
}

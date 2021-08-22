//
//  EventsListVM.swift
//  EventsApp
//
//  Created by Hiram Castro on 21/08/21.
//

import Foundation

class EventsListMV {
    
    private var eventsArray:[EventModel]?
    private let helper = HelperManager()
    
    init() {
        eventsArray = helper.loadJson(fileName: "mock")
    }
    
    func getEventsCount() -> Int {
        return eventsArray?.count ?? 0
    }
    
    func getEventAt(position:Int) -> EventModel? {
        return eventsArray?[position]
    }
    
}

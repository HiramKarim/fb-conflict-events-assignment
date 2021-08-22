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
    var convertedArray: [Date] = []
    
    init() {
        eventsArray = helper.loadJson(fileName: "mock")
        eventsArray = eventsArray?.sorted(by:{$0.eventStartDate.toDate()?.compare($1.eventStartDate.toDate() ?? Date()) == .orderedAscending})
    }
    
    func getEventsCount() -> Int {
        return eventsArray?.count ?? 0
    }
    
    func getEventAt(position:Int) -> EventModel? {
        return eventsArray?[position]
    }
    
}

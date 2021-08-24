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
    private var dateGroup = [String:[EventModel]]()
    private var titlesArray = [String]()
    private var conflictEvent = [String:Bool]()
    
    init() {
        eventsArray = helper.loadJson(fileName: "mock")
        eventsArray = eventsArray?.sorted(by:{$0.eventStartDate.toDate()?.compare($1.eventStartDate.toDate() ?? Date()) == .orderedAscending}) /// Complexity: O(n log n)
        groupEvents(eventsArray: eventsArray)
        findEventsOverlaps(dateGroup: dateGroup)
    }
    
    /// This method groups the events by date
    /// Input: an array of event's model
    private func groupEvents(eventsArray:[EventModel]?) {
        for event in eventsArray ?? [] {
            let stringInfo = event.eventStartDate.components(separatedBy: ",")
            let headerTitle = stringInfo[0]
            
            if dateGroup.keys.contains(headerTitle) {
                var eventsElements = dateGroup[headerTitle]
                eventsElements?.append(event)
                dateGroup[headerTitle] = eventsElements
            } else {
                titlesArray.append(headerTitle)
                dateGroup[headerTitle] = [event]
            }
        }
    }
    
    private func findEventsOverlaps(dateGroup : [String:[EventModel]]) {
        
        for key in dateGroup.keys.enumerated() {
            
            let elements = dateGroup[key.element]
            
            for index in (0...(elements?.count ?? 0) - 1) {
                
                if index == ((elements?.count ?? 0) - 1) {
                    continue
                } else {
                    let event1 = elements?[index]
                    let event2 = elements?[index + 1]
                    
                    if doEventsOverlap(event1!, event2!) {
                        conflictEvent[(event1?.eventTitle ?? "")] = true
                    }
                    
                }
                
            }
            
        }
        
    }
    
    private func doEventsOverlap(_ eventOne: EventModel, _ eventTwo: EventModel) -> Bool {
        let leftRange = eventOne.eventStartDate.toDate()! ... eventOne.eventEndDate.toDate()!
        let rightRange = eventTwo.eventStartDate.toDate()! ... eventTwo.eventEndDate.toDate()!
        return leftRange.overlaps(rightRange)
    }
    
    func getSectionsCount() -> Int {
        return dateGroup.count
    }
    
    func getTitleForSection(section:Int) -> String {
        return titlesArray[section]
    }
    
    func getElementsCountForSection(section:Int) -> Int {
        let title = getTitleForSection(section: section)
        return dateGroup[title]?.count ?? 0
    }
    
    func getEvent(section:Int, index:Int) -> EventModel? {
        let title = getTitleForSection(section: section)
        let eventsCollection = dateGroup[title]
        return eventsCollection?[index]
    }
    
    func getConflictEvent(eventName:String) -> Bool {
        return conflictEvent[eventName] ?? false
    }
    
}

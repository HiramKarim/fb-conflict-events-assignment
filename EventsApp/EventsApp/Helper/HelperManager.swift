//
//  HelperManager.swift
//  EventsApp
//
//  Created by Hiram Castro on 21/08/21.
//

import Foundation

class HelperManager {
    
    func loadJson(fileName: String) -> [EventModel]? {
       let decoder = JSONDecoder()
       guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let events = try? decoder.decode([EventModel].self, from: data)
       else {
            return nil
       }

       return events
    }
    
}
